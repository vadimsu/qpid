# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vadim/projects/qpid-proton-0.7

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vadim/projects/qpid-proton-0.7/build

# Utility rule file for docs.

# Include the progress variables for this target.
include proton-c/CMakeFiles/docs.dir/progress.make

proton-c/CMakeFiles/docs:

docs: proton-c/CMakeFiles/docs
docs: proton-c/CMakeFiles/docs.dir/build.make
.PHONY : docs

# Rule to build all files generated by this target.
proton-c/CMakeFiles/docs.dir/build: docs
.PHONY : proton-c/CMakeFiles/docs.dir/build

proton-c/CMakeFiles/docs.dir/clean:
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c && $(CMAKE_COMMAND) -P CMakeFiles/docs.dir/cmake_clean.cmake
.PHONY : proton-c/CMakeFiles/docs.dir/clean

proton-c/CMakeFiles/docs.dir/depend:
	cd /home/vadim/projects/qpid-proton-0.7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vadim/projects/qpid-proton-0.7 /home/vadim/projects/qpid-proton-0.7/proton-c /home/vadim/projects/qpid-proton-0.7/build /home/vadim/projects/qpid-proton-0.7/build/proton-c /home/vadim/projects/qpid-proton-0.7/build/proton-c/CMakeFiles/docs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : proton-c/CMakeFiles/docs.dir/depend

