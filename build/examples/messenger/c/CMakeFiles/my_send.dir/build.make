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

# Include any dependencies generated for this target.
include examples/messenger/c/CMakeFiles/my_send.dir/depend.make

# Include the progress variables for this target.
include examples/messenger/c/CMakeFiles/my_send.dir/progress.make

# Include the compile flags for this target's objects.
include examples/messenger/c/CMakeFiles/my_send.dir/flags.make

examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o: examples/messenger/c/CMakeFiles/my_send.dir/flags.make
examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o: ../examples/messenger/c/my_send.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/vadim/projects/qpid-proton-0.7/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o"
	cd /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/my_send.dir/my_send.c.o   -c /home/vadim/projects/qpid-proton-0.7/examples/messenger/c/my_send.c

examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/my_send.dir/my_send.c.i"
	cd /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/vadim/projects/qpid-proton-0.7/examples/messenger/c/my_send.c > CMakeFiles/my_send.dir/my_send.c.i

examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/my_send.dir/my_send.c.s"
	cd /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/vadim/projects/qpid-proton-0.7/examples/messenger/c/my_send.c -o CMakeFiles/my_send.dir/my_send.c.s

examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.requires:
.PHONY : examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.requires

examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.provides: examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.requires
	$(MAKE) -f examples/messenger/c/CMakeFiles/my_send.dir/build.make examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.provides.build
.PHONY : examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.provides

examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.provides.build: examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o

# Object files for target my_send
my_send_OBJECTS = \
"CMakeFiles/my_send.dir/my_send.c.o"

# External object files for target my_send
my_send_EXTERNAL_OBJECTS =

examples/messenger/c/my_send: examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o
examples/messenger/c/my_send: proton-c/libqpid-proton.so.2.0.0
examples/messenger/c/my_send: /usr/lib/x86_64-linux-gnu/libssl.so
examples/messenger/c/my_send: /usr/lib/x86_64-linux-gnu/libcrypto.so
examples/messenger/c/my_send: examples/messenger/c/CMakeFiles/my_send.dir/build.make
examples/messenger/c/my_send: examples/messenger/c/CMakeFiles/my_send.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable my_send"
	cd /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_send.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/messenger/c/CMakeFiles/my_send.dir/build: examples/messenger/c/my_send
.PHONY : examples/messenger/c/CMakeFiles/my_send.dir/build

examples/messenger/c/CMakeFiles/my_send.dir/requires: examples/messenger/c/CMakeFiles/my_send.dir/my_send.c.o.requires
.PHONY : examples/messenger/c/CMakeFiles/my_send.dir/requires

examples/messenger/c/CMakeFiles/my_send.dir/clean:
	cd /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c && $(CMAKE_COMMAND) -P CMakeFiles/my_send.dir/cmake_clean.cmake
.PHONY : examples/messenger/c/CMakeFiles/my_send.dir/clean

examples/messenger/c/CMakeFiles/my_send.dir/depend:
	cd /home/vadim/projects/qpid-proton-0.7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vadim/projects/qpid-proton-0.7 /home/vadim/projects/qpid-proton-0.7/examples/messenger/c /home/vadim/projects/qpid-proton-0.7/build /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c /home/vadim/projects/qpid-proton-0.7/build/examples/messenger/c/CMakeFiles/my_send.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/messenger/c/CMakeFiles/my_send.dir/depend

