#!/bin/bash
for x in `seq 1 6`; do ab -n 100 -c 2 localhost; sleep 300; done
ab -n 2000 -c 2 localhost
for x in `seq 1 6`; do ab -n 100 -c 2 localhost; sleep 300; done
