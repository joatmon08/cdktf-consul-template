#!/bin/sh

trap 'quit=1' USR1

if [ "$1" = "cdktf" ]; then
    cdktf get
    cdktf diff
elif [ "$1" = "terraform" ]; then
    terraform init "${2}"
    terraform plan -out=consul-template.tfplan
else
    echo "choose cdktf or terraform"
fi

quit=0
while [ "$quit" -ne 1 ]; do
    sleep 1
    echo "Reloading terraform plan..."
done

