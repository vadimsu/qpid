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
include proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/depend.make

# Include the progress variables for this target.
include proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/progress.make

# Include the compile flags for this target's objects.
include proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/flags.make

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/flags.make
proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o: ../proton-c/src/tests/parse-url.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/vadim/projects/qpid-proton-0.7/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/c-parse-url-tests.dir/parse-url.c.o   -c /home/vadim/projects/qpid-proton-0.7/proton-c/src/tests/parse-url.c

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/c-parse-url-tests.dir/parse-url.c.i"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/vadim/projects/qpid-proton-0.7/proton-c/src/tests/parse-url.c > CMakeFiles/c-parse-url-tests.dir/parse-url.c.i

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/c-parse-url-tests.dir/parse-url.c.s"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/vadim/projects/qpid-proton-0.7/proton-c/src/tests/parse-url.c -o CMakeFiles/c-parse-url-tests.dir/parse-url.c.s

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.requires:
.PHONY : proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.requires

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.provides: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.requires
	$(MAKE) -f proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/build.make proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.provides.build
.PHONY : proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.provides

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.provides.build: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o

# Object files for target c-parse-url-tests
c__parse__url__tests_OBJECTS = \
"CMakeFiles/c-parse-url-tests.dir/parse-url.c.o"

# External object files for target c-parse-url-tests
c__parse__url__tests_EXTERNAL_OBJECTS =

proton-c/src/tests/c-parse-url-tests: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o
proton-c/src/tests/c-parse-url-tests: proton-c/libqpid-proton.so.2.0.0
proton-c/src/tests/c-parse-url-tests: /usr/lib/x86_64-linux-gnu/libssl.so
proton-c/src/tests/c-parse-url-tests: /usr/lib/x86_64-linux-gnu/libcrypto.so
proton-c/src/tests/c-parse-url-tests: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/build.make
proton-c/src/tests/c-parse-url-tests: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable c-parse-url-tests"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/c-parse-url-tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/build: proton-c/src/tests/c-parse-url-tests
.PHONY : proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/build

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/requires: proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/parse-url.c.o.requires
.PHONY : proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/requires

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/clean:
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests && $(CMAKE_COMMAND) -P CMakeFiles/c-parse-url-tests.dir/cmake_clean.cmake
.PHONY : proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/clean

proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/depend:
	cd /home/vadim/projects/qpid-proton-0.7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vadim/projects/qpid-proton-0.7 /home/vadim/projects/qpid-proton-0.7/proton-c/src/tests /home/vadim/projects/qpid-proton-0.7/build /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests /home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : proton-c/src/tests/CMakeFiles/c-parse-url-tests.dir/depend

