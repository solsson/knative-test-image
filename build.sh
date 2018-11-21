#!/bin/sh

[ -z "$REGISTRY_NAMESPACE" ] && REGISTRY_NAMESPACE=docker.io/$USER/

i=0
while [ $i -le 9 ]; do
  IMAGE="${REGISTRY_NAMESPACE}knative-test-image:build$i"
  echo "Building $IMAGE"
  docker build -t $IMAGE --build-arg buildnum=$i .
  docker push $IMAGE
  i=$(( i + 1 ))
done
