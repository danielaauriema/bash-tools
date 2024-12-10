#!/bin/bash
set -e

BASH_WAIT_COUNTER=0
BASH_WAIT_SLEEP=1

_bash_wait_for(){
  until (( BASH_WAIT_COUNTER <= 0 )) || eval "$1" > /dev/null; do
      sleep "${BASH_WAIT_SLEEP}"
      (( BASH_WAIT_COUNTER-- ))
  done
  (( BASH_WAIT_COUNTER > 0 ))
}

_bash_test_section(){
  echo "*** $1 ***"
}

_bash_test_eval(){
    if [[ $BASH_WAIT_COUNTER -gt 0 ]]; then
      _bash_wait_for "$1"
    else
      eval "$1" > /dev/null
    fi;
}

_bash_test_line(){
  local ls_prefix2=${1:0:2}
  if [ "$ls_prefix2" == "@ " ]; then
    _bash_test_section "${1:2}"
  elif [ "$ls_prefix2" == "+ " ]; then
    TEST_DESCRIPTION="${1:2}"
  elif [ "$ls_prefix2" == "* " ]; then
    eval "${1:2}" > /dev/null
  elif [[ ! ( -z "$1"  || "${1:0:1}" == "#" )  ]]; then
    if _bash_test_eval "$1"; then
        echo "OK    ${TEST_DESCRIPTION}";
    else
      echo "ERROR ${TEST_DESCRIPTION}";
      exit 1
    fi
  fi
}

# bash_test <bash_test_input_file>
bash_test(){
  local test_input_file="$1"
  while read -r line
  do
    _bash_test_line "$line"
  done < "$test_input_file"
  if [[ -n "$line" ]]; then
    _bash_test_line "$line"
  fi
}

if [ -n "$1" ]; then
  bash_test "$1"
fi
