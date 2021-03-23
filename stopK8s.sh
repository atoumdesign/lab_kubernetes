#!/bin/bash
kubectl delete -f secret.yml
kubectl delete -f configmap.yml
kubectl delete -f clusterIP.yml
kubectl delete -f statefulset.yml
kubectl delete -f loadBalancer.yml
kubectl delete -f deployment.yml
kubectl delete -f hpa.yml
