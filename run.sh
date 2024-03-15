#!/bin/bash

docker build -t quote_server:$TAG_VERSION .
kubectl apply -f Kubernetes/deployment.yaml
kubectl apply -f Kubernetes/service.yaml
