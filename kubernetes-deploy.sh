#!/bin/sh
if [ -z "$DOCKER_ACCOUNT" ]; then
    DOCKER_ACCOUNT=harbor.example.com:80
fi;
kubectl run apache --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:latest --port=80
kubectl expose deployment/apache --type="NodePort" --port 80
kubectl run catalog --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:latest --port=8080
kubectl expose deployment/catalog --type="NodePort" --port 8080
kubectl run customer --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:latest --port=8080
kubectl expose deployment/customer --type="NodePort" --port 8080
kubectl run order --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-order:latest --port=8080
kubectl expose deployment/order --type="NodePort" --port 8080
