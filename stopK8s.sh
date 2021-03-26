#!/bin/bash
kubectl delete -f secret.yml
kubectl delete -f configmap.yml
kubectl delete -f barbearia-db.yml
kubectl delete -f barbearia-app.yml
kubectl delete -f barbearia-ingress.yml

