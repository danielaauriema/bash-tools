#!/bin/false

@ Test section 1

+ test 1.1
true

+ test 1.2
true

@ Timeout test

+ test 2.1::wait
* BASH_WAIT_COUNTER=5
echo "*** ${BASH_WAIT_COUNTER}" && [[ $BASH_WAIT_COUNTER -eq 2 ]]

+ test 2.2::OK
true

