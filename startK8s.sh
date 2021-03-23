#!/bin/bash
kubectl apply -f secret.yml
kubectl apply -f configmap.yml
kubectl apply -f clusterIP.yml
kubectl apply -f statefulset.yml
kubectl apply -f loadBalancer.yml
kubectl apply -f deployment.yml
kubectl apply -f hpa.yml

