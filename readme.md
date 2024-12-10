# Bash Tools!

This repository is a collection of basic tools to help out with simple tasks in another projects.

## Bash Test

To use it, add the following command on top of your script:

```
curl https://raw.githubusercontent.com/danielaauriema/bash-tools/master/bash-test/bash-test.sh > bash-test.sh
```

This is a very simple script to help with testing. To make it works you need to write the test in another file using a special notation, and then run it using the following command: 

```
./bash-test.sh <test-file-name> 
```

The syntax is just add a special character in the begging of the line. It actually supports only 3 commands:

- '@' Start a new test section;
- '+' Add a test description for your scenario
- '*' Run bash commands to prepare the test environment
- Anything else is executed as a bash command. The test passes if the return code is zero.

Example:

```
#!/bin/false

@ Test section 1
+ test 1.1
true
+ test 1.2
true

@ Test section 2
+ test 2.1
true
+ test 2.2
* BASH_WAIT_COUNTER=5
echo "*** ${BASH_WAIT_COUNTER}" && [[ $BASH_WAIT_COUNTER -eq 2 ]]
```

if all tests are passed, the script returns 0, otherwise it returns 1.
