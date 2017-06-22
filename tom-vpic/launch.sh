#!/bin/bash

echo "Sleeping 5 on master"

sleep 5

echo "Starting vpic on master"

# make the run directory belong to vpic
cp -r /root/* /mnt/vpicrun
mkdir -p /mnt/vpicrun/vpic.bin

# run the vpic code  on master
/mnt/vpicrun/runvpic.sh 

