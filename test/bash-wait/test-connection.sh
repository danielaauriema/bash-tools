#!/bin/false

@ bash_wait_for_connection

+ pull postgres container
docker pull postgres:14-alpine

+ pull nginx container
docker pull nginx:alpine-slim

+ run postgres container
docker run --rm --name postgres_test -p "15432:5432" -e POSTGRES_PASSWORD=password -d postgres:14-alpine

+ wait for connection
bash_wait_for_connection "localhost:15432"

+ run nginx container
docker run --rm --name nginx_test -p "81:80" -d nginx:alpine-slim

+ wait for uri
bash_wait_for_uri "http://localhost:81"

+ stop postgres container
docker stop postgres_test nginx_test

