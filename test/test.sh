#!/bin/bash
set -e

. ../lib/bash-test.sh
. ../lib/bash-wait.sh

bash_test_header "Test :: bash-test"

bash_test ./bash-test/test-ok.sh
( bash_test ./bash-test/test-error.sh && false ) || true

bash_test_header "Test :: bash-wait"

bash_test ./bash-wait/test-ok.sh
bash_test ./bash-wait/test-timeout.sh
bash_test ./bash-wait/test-connection.sh

bash_test_header "Test :: all tests has finished successfully!!"
