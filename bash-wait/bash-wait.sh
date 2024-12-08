#!/bin/false

bash_wait_for(){
  local counter="${2:-10}"
  local delay="${3:-1}"
  until (( counter <= 0 )) || eval "$1"; do
      sleep "${delay}"
      (( counter-- ))
  done
  if [[ "$counter" -le 0 ]]; then
    echo "*** bash-wait timeout!" >&2
    false
  fi
}