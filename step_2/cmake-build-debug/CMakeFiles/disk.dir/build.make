# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aaronurrea/Projects/UrreaAaronProject01/step_2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/disk.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/disk.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/disk.dir/flags.make

CMakeFiles/disk.dir/disk.c.o: CMakeFiles/disk.dir/flags.make
CMakeFiles/disk.dir/disk.c.o: ../disk.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/disk.dir/disk.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/disk.dir/disk.c.o   -c /home/aaronurrea/Projects/UrreaAaronProject01/step_2/disk.c

CMakeFiles/disk.dir/disk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/disk.dir/disk.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/aaronurrea/Projects/UrreaAaronProject01/step_2/disk.c > CMakeFiles/disk.dir/disk.c.i

CMakeFiles/disk.dir/disk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/disk.dir/disk.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/aaronurrea/Projects/UrreaAaronProject01/step_2/disk.c -o CMakeFiles/disk.dir/disk.c.s

CMakeFiles/disk.dir/test_disk.c.o: CMakeFiles/disk.dir/flags.make
CMakeFiles/disk.dir/test_disk.c.o: ../test_disk.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/disk.dir/test_disk.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/disk.dir/test_disk.c.o   -c /home/aaronurrea/Projects/UrreaAaronProject01/step_2/test_disk.c

CMakeFiles/disk.dir/test_disk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/disk.dir/test_disk.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/aaronurrea/Projects/UrreaAaronProject01/step_2/test_disk.c > CMakeFiles/disk.dir/test_disk.c.i

CMakeFiles/disk.dir/test_disk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/disk.dir/test_disk.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/aaronurrea/Projects/UrreaAaronProject01/step_2/test_disk.c -o CMakeFiles/disk.dir/test_disk.c.s

# Object files for target disk
disk_OBJECTS = \
"CMakeFiles/disk.dir/disk.c.o" \
"CMakeFiles/disk.dir/test_disk.c.o"

# External object files for target disk
disk_EXTERNAL_OBJECTS =

bin/disk: CMakeFiles/disk.dir/disk.c.o
bin/disk: CMakeFiles/disk.dir/test_disk.c.o
bin/disk: CMakeFiles/disk.dir/build.make
bin/disk: CMakeFiles/disk.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable bin/disk"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/disk.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/disk.dir/build: bin/disk

.PHONY : CMakeFiles/disk.dir/build

CMakeFiles/disk.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/disk.dir/cmake_clean.cmake
.PHONY : CMakeFiles/disk.dir/clean

CMakeFiles/disk.dir/depend:
	cd /home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aaronurrea/Projects/UrreaAaronProject01/step_2 /home/aaronurrea/Projects/UrreaAaronProject01/step_2 /home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug /home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug /home/aaronurrea/Projects/UrreaAaronProject01/step_2/cmake-build-debug/CMakeFiles/disk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/disk.dir/depend

