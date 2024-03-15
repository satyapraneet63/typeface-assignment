#!/bin/bash

docker build -t quote_server:$tag .
kubectl apply -f Kubernetes/deployment.yaml
kubectl apply -f Kubernetes/service.yaml
