#!/bin/sh

trap 'quit=1' USR1

echo "Reloading terraform plan..."

if [ "$1" = "cdktf" ]; then
    npm run build
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
done

