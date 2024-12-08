#!/bin/bash
set -e

. bash-wait.sh

echo "*** bash-test 1"
bash_wait_for "echo \"*** \${counter}\" && false" 5

echo "*** should not show this"
