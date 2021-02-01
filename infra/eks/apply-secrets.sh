#!/bin/bash
set -e
ns=$1

if [ -z $ns ]
then
   echo "better to have namespace"
   exit -1
fi

aws s3 cp s3://sample-credentials/exchange-secret.yaml  tmp.yaml
kubectl apply -f tmp.yaml -n $ns

function cleanup()
{
   rm -f tmp.yaml
}

trap cleanup EXIT