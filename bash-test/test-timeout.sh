#!/bin/false

@ Test timeout

+ test 1.1::OK
true

+ test 1.2::timeout
* BASH_WAIT_COUNTER=3
false

+ test 1.3::should not execute
true
