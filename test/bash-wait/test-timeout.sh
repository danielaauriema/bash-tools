#!/bin/false

@ bash_wait_for :: timeout

+ bash_wait_for :: timeout
! ( bash_wait_for "false" 5 )

