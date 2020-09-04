#!/bin/sh -l
codefresh auth create-context --api-key $1
helm plugin install https://github.com/chartmuseum/helm-push
helm repo add default-repo $2
helm push ./chart default-repo
ls
echo "Hello $1 $2"
time=$(date)
echo "::set-output name=time::$time"