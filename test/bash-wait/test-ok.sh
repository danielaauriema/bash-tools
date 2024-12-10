#!/bin/false

@ bash_wait_for :: OK

+ bash_wait_for
bash_wait_for "[[ \counter -eq 7 ]]"

+ bash_wait_for :: with params
bash_wait_for "[[ \counter -eq 2 ]]" 4 2
