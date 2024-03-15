#!/bin/bash

docker build -t quote_server:$tag .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
