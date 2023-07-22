// Aaron Urrea
//  COMP 362-01L
//  4/25/22

//////////////////////////////////////////////////////////////////////////
///
/// Copyright (c) 2020 Prof. AJ Bieszczad. All rights reserved.
///
//////////////////////////////////////////////////////////////////////////

#include "disk.h"

disk_t disk;

/***
 *
 * Verifies correctness of the logical block address, and then translates it to a cylinder-head-sector equivalent.
 *
 */
CIDEV_RET_CODE lba2chs(lba_t lba, chs_t *chs)
{
    // TODO: Implement - COMPLETE

    if (lba >= MAX_LOGICAL_BLOCK)
        return CIDEV_ADDRESS_ERROR;

    chs->cyl = lba / (NUM_OF_HEADS * NUM_OF_SECTS);
    chs->head = (lba / NUM_OF_SECTS) % NUM_OF_HEADS;
    chs ->sect = (lba % NUM_OF_SECTS);

    return CIDEV_SUCCESS;
}

/***
 *
 * Verifies correctness of the cylinder-head-sector address, and then translates it to a logical block address.
 *
 */
CIDEV_RET_CODE chs2lba(chs_t *chs, lba_t *lba)
{
    // TODO: Implement - COMPLETE

    if(chs->cyl > NUM_OF_CYLS || chs->head > NUM_OF_HEADS || chs->sect > NUM_OF_SECTS)
        return CIDEV_ADDRESS_ERROR;

    *lba = (chs->cyl * NUM_OF_HEADS + chs->head) * NUM_OF_SECTS + (chs->sect);

    return CIDEV_SUCCESS;
}
/***
 *
 * Verifies the parameters, then allocates space for the requested data (using
 * the caller-provided pointer buffer), copies the data from the disk to the buffer,
 * and appends '\0' to terminate the string.
 *
 */
CIDEV_RET_CODE readDisk(lba_t lba, unsigned int size, char **buffer)
{
    // TODO: Verify the Parameters and Implement - COMPLETE

    chs_t chs;
    CIDEV_RET_CODE errCode = lba2chs(lba, &chs);

    // Verifies Parameters
    int availableSpace = (MAX_LOGICAL_BLOCK * SECT_SIZE) - (lba * SECT_SIZE);

    if(size > availableSpace) {
        printf("\nSIZE OF DATA!: %d\n", (int) (size));
        printf("SPACE AVAILABLE!: %d\n", (int) ((MAX_LOGICAL_BLOCK * SECT_SIZE) - (lba * SECT_SIZE)));
        errCode = CIDEV_SPACE_ERROR;
    }

    if(errCode != CIDEV_SUCCESS)
        return errCode;

    // Allocates space for the requested data
    //  Also, we clear any data previously in the buffer, as
    //  we're working with new data.
    (*buffer) = malloc((size + 1) * sizeof(char));
    memset(*buffer,'\0', 1);

    // These are our iterators and control values
    int cylinder, head, sector, sectorIndex, bufferIterator = 0;
    bool firstTime = true;

    // Copies data from disk to buffer
    for(cylinder = 0; cylinder < NUM_OF_CYLS; cylinder++) {
        for (head = 0; head < NUM_OF_HEADS; head++) {
            for (sector = 0; sector < NUM_OF_SECTS; sector++) {
                for (sectorIndex = 0; sectorIndex < SECT_SIZE; sectorIndex++) {
                    if (firstTime == true) {
                        cylinder = chs.cyl;
                        head = chs.head;
                        sector = chs.sect;

                        firstTime = false;
                    }

                    if (bufferIterator < size) {
                        char currentCharacter = disk[cylinder][head][sector][sectorIndex];
                        strncat(*buffer, &currentCharacter, 1);
                    }
                    bufferIterator++;
                }
            }
        }
    }
    strcat(*buffer, "\0");
    printf("\n");

    return errCode;
}

/***
 *
 * An auxiliary function to fill a single disk block with '.'
 *
*/
CIDEV_RET_CODE clearBlock(lba_t lba)
{
    char *writeBuffer;
#ifdef __DEBUG_DISK
    writeBuffer = malloc(SECT_SIZE);
#else
    writeBuffer = kmalloc(SECT_SIZE, GFP_USER);
#endif
    if (writeBuffer == NULL)
        return CIDEV_SPACE_ERROR;

    for (int i = 0; i < SECT_SIZE; i++)
        writeBuffer[i] = '.';

    CIDEV_RET_CODE errCode = writeDisk(lba, writeBuffer);

#ifdef __DEBUG_DISK
    free(writeBuffer);
#else
    kfree(writeBuffer);
#endif

    return errCode;
}

/***
 *
 * Validates the parameters, and then writes the caller-provided data to the disk starting at the block pointed
 * to by the logical block address.
 *
 */
CIDEV_RET_CODE writeDisk(lba_t lba, char *buffer)
{
    // TODO: Verify the Parameters and Implement - COMPLETE

    chs_t chs;
    CIDEV_RET_CODE errCode = lba2chs(lba, &chs);

    int availableSpace = (MAX_LOGICAL_BLOCK * SECT_SIZE) - (lba * SECT_SIZE), size = strlen(buffer);

    if(size > availableSpace) {
        printf("\nSIZE OF DATA!: %d\n", (int) (size));
        printf("SPACE AVAILABLE!: %d\n", (int) ((MAX_LOGICAL_BLOCK * SECT_SIZE) - (lba * SECT_SIZE)));
        errCode = CIDEV_SPACE_ERROR;
    }
    if(errCode != CIDEV_SUCCESS) {
        return errCode;
    }

    int cylinder, head, sector, sectorIndex, bufferIterator = 0;

    bool firstTime = true;

    for(cylinder = 0; cylinder < NUM_OF_CYLS; cylinder++) {
        for (head = 0; head < NUM_OF_HEADS; head++) {
            for (sector = 0; sector < NUM_OF_SECTS; sector++) {
                for (sectorIndex = 0; sectorIndex < SECT_SIZE; sectorIndex++) {
                    if (firstTime == true) {
                        cylinder = chs.cyl;
                        head = chs.head;
                        sector = chs.sect;

                        firstTime = false;
                    }

                    if (bufferIterator < size) {
                        char currentCharacter = buffer[bufferIterator];
                        disk[cylinder][head][sector][sectorIndex] = currentCharacter;
                    }
                    bufferIterator++;
                }
            }
        }
    }

    printf("\n");

    return errCode;
}
