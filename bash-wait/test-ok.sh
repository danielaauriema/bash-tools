#!/bin/bash
set -e

. bash-wait.sh

echo "*** bash-test 1"
bash_wait_for "echo \"*** \${counter}\" && [[ \counter -eq 7 ]]"

echo "*** bash-test 2"
bash_wait_for "echo \"*** \${counter}\" && [[ \counter -eq 2 ]]" 4 2

echo "bash-wait test finished OK"
