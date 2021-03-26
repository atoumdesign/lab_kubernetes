#!/bin/bash

cluster_name='cluster1'

# instalar doctl
sudo snap install doctl
sudo snap install kubectl

# conectar com digital ocean
mkdir .config
doctl auth init

# linkar comandos
sudo snap connect doctl:kube-config

# configurar kubernetes da digital ocean
mkdir .kube
doctl kubernetes cluster create $cluster_name --node-pool name=pool-$cluster_name;count=3
doctl kubernetes cluster kubeconfig save $cluster_name 

# instalar plugins de armazenamento
kubectl apply -f secret.yml
kubectl apply -fhttps://raw.githubusercontent.com/digitalocean/csi-digitalocean/master/deploy/kubernetes/releases/csi-digitalocean-v2.1.1/{crds.yaml,driver.yaml,snapshot-controller.yaml}
kubectl apply -f pvc.yml

# instalar ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.1/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.1/deploy/static/provider/cloud-generic.yaml -n ingress-nginx
kubectl create namespace cert-manager
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.12.0/cert-manager.yaml
kubectl create -f staging_issuer.yml

# instalar servidor de metricas
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# iniciar aplicação
kubectl apply -f db-configmap.yml
kubectl apply -f barbearia-db.yml
kubectl apply -f brabearia-app.yml
kubectl apply -f barbearia-ingress.yml
#kubectl apply -f hpa.yml
#kubectl apply -f test-hpa.yml
#kubectl create -f prod_issuer.yml
