#!/bin/sh

trap 'quit=1' USR1

cdktf diff

quit=0
while [ "$quit" -ne 1 ]; do
    sleep 1
done

echo "Reloading Terraform plan"
