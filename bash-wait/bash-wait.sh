#!/bin/false
set -e

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

bash_wait_for_connection(){
  local host="${1}"
  local port="${2}"
  local counter="${2:-10}"
  local delay="${3:-1}"
  bash_wait_for "curl -s -t BOGUS telnet://${host}:${port} || [ \$? -eq 49 ]" "${counter}" "${delay}"
}