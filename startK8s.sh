#!/bin/bash
kubectl apply -f secret.yml
kubectl apply -f configmap.yml
kubectl apply -f barbearia-db.yml
kubectl apply -f barbearia-app.yml
kubectl apply -f barbearia-ingress.yml

