#!/bin/sh
set -e

docker build -t command_test .
docker run --rm -e BASE_COMMAND="uname" command_test -a
docker run --rm -e BASE_COMMAND="ls" command_test
docker run --rm -e BASE_COMMAND="echo" command_test foo bar
docker run --rm command_test ls

docker rmi command_test


