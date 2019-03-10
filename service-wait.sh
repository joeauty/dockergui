#!/usr/bin/env bash

function test_db {
  nc -z db 5432
}

count=0
# Chain tests together by using &&
until ( test_db )
do
  ((count++))
  if [ ${count} -gt 60 ]
  then
    echo "Services didn't become ready in time"
    exit 1
  fi
  sleep 1
done

echo All services have started.

sleep 15
