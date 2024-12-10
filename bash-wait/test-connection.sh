#!/bin/bash
set -e

. bash-wait.sh

echo "*** pull postgres container"
docker pull postgres

echo "*** pull postgres container"
docker run --rm --name postgres_test -p "15432:5432" -e POSTGRES_PASSWORD=password -d postgres

echo "*** wait for connection"
bash_wait_for_connection "localhost" "15432"

echo "*** stop postgres container"
docker stop postgres_test

echo "*** bash-wait-for-connection finished OK"
