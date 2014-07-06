# CMake generated Testfile for 
# Source directory: /home/vadim/projects/qpid-proton-0.7/proton-c
# Build directory: /home/vadim/projects/qpid-proton-0.7/build/proton-c
# 
# This file includes the relevent testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(python-test "/usr/bin/python" "/home/vadim/projects/qpid-proton-0.7/proton-c/env.py" "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python:/home/vadim/projects/qpid-proton-0.7/build/proton-c:/home/vadim/projects/qpid-proton-0.7/build/tests/tools/apps/c:/home/vadim/projects/qpid-proton-0.7/tests/tools/apps/python" "PYTHONPATH=/home/vadim/projects/qpid-proton-0.7/tests/python:/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python:/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python:/home/vadim/projects/qpid-proton-0.7/build/proton-c" "/usr/bin/python" "/home/vadim/projects/qpid-proton-0.7/tests/python/proton-test")
SET_TESTS_PROPERTIES(python-test PROPERTIES  PASS_REGULAR_EXPRESSION "Totals: .* 0 failed")
ADD_TEST(ruby-unit-test "/usr/bin/python" "/home/vadim/projects/qpid-proton-0.7/proton-c/env.py" "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby:/home/vadim/projects/qpid-proton-0.7/build/proton-c" "RUBYLIB=/home/vadim/projects/qpid-proton-0.7/tests/ruby:/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby:/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby:/home/vadim/projects/qpid-proton-0.7/build/proton-c:/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby/lib" "/home/vadim/projects/qpid-proton-0.7/tests/ruby/proton-test")
ADD_TEST(ruby-spec-test "/usr/bin/python" "/home/vadim/projects/qpid-proton-0.7/proton-c/env.py" "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby:/home/vadim/projects/qpid-proton-0.7/build/proton-c" "RUBYLIB=/home/vadim/projects/qpid-proton-0.7/tests/ruby:/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby:/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby:/home/vadim/projects/qpid-proton-0.7/build/proton-c:/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby/lib" "/usr/local/bin/rspec")
SET_TESTS_PROPERTIES(ruby-spec-test PROPERTIES  WORKING_DIRECTORY "/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby")
SUBDIRS(bindings)
SUBDIRS(docs/api)
SUBDIRS(docs/man)
SUBDIRS(../tests/tools/apps/c)
SUBDIRS(src/tests)
SUBDIRS(../examples)
