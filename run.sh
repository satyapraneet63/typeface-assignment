#!/bin/bash

docker build -t quote_server:$tag /home/praneet/personal/typeface-assignment/
kubectl apply -f Kubernetes/deployment.yaml
kubectl apply -f Kubernetes/service.yaml
