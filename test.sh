#!/bin/sh -l

pwd
ls

echo "Hello $1 $2"
time=$(date)
echo "::set-output name=time::$time"
