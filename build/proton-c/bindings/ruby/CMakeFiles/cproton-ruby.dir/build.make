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
include proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/depend.make

# Include the progress variables for this target.
include proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/progress.make

# Include the compile flags for this target's objects.
include proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/flags.make

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/flags.make
proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o: proton-c/bindings/ruby/rubyRUBY_wrap.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/vadim/projects/qpid-proton-0.7/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o   -c /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby/rubyRUBY_wrap.c

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.i"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby/rubyRUBY_wrap.c > CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.i

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.s"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby/rubyRUBY_wrap.c -o CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.s

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.requires:
.PHONY : proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.requires

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.provides: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.requires
	$(MAKE) -f proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/build.make proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.provides.build
.PHONY : proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.provides

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.provides.build: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o

proton-c/bindings/ruby/rubyRUBY_wrap.c: ../proton-c/bindings/ruby/ruby.i
	$(CMAKE_COMMAND) -E cmake_progress_report /home/vadim/projects/qpid-proton-0.7/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Swig source"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && /usr/bin/cmake -E make_directory /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && /usr/bin/swig2.0 -ruby -outdir /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby -I/home/vadim/projects/qpid-proton-0.7/build/proton-c -I/home/vadim/projects/qpid-proton-0.7/build/proton-c/include -I/home/vadim/projects/qpid-proton-0.7/proton-c/include -I/home/vadim/projects/qpid-proton-0.7/proton-c/../examples/include -I/usr/lib/ruby/1.8/x86_64-linux -o /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby/rubyRUBY_wrap.c /home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby/ruby.i

# Object files for target cproton-ruby
cproton__ruby_OBJECTS = \
"CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o"

# External object files for target cproton-ruby
cproton__ruby_EXTERNAL_OBJECTS =

proton-c/bindings/ruby/cproton.so: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o
proton-c/bindings/ruby/cproton.so: proton-c/libqpid-proton.so.2.0.0
proton-c/bindings/ruby/cproton.so: /usr/lib/libruby1.8.so
proton-c/bindings/ruby/cproton.so: /usr/lib/x86_64-linux-gnu/libssl.so
proton-c/bindings/ruby/cproton.so: /usr/lib/x86_64-linux-gnu/libcrypto.so
proton-c/bindings/ruby/cproton.so: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/build.make
proton-c/bindings/ruby/cproton.so: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared module cproton.so"
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cproton-ruby.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/build: proton-c/bindings/ruby/cproton.so
.PHONY : proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/build

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/requires: proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/rubyRUBY_wrap.c.o.requires
.PHONY : proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/requires

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/clean:
	cd /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby && $(CMAKE_COMMAND) -P CMakeFiles/cproton-ruby.dir/cmake_clean.cmake
.PHONY : proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/clean

proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/depend: proton-c/bindings/ruby/rubyRUBY_wrap.c
	cd /home/vadim/projects/qpid-proton-0.7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vadim/projects/qpid-proton-0.7 /home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby /home/vadim/projects/qpid-proton-0.7/build /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : proton-c/bindings/ruby/CMakeFiles/cproton-ruby.dir/depend

