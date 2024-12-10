#!/bin/false

@ bash_wait_for_connection

+ pull postgres container
docker pull postgres

+ run postgres container
docker run --rm --name postgres_test -p "15432:5432" -e POSTGRES_PASSWORD=password -d postgres

+ wait for connection
bash_wait_for_connection "localhost" "15432"

+ stop postgres container
docker stop postgres_test
