#!/bin/bash

cluster_name='cluster1'

# instalar doctl
sudo snap install doctl

# conectar com digital ocean
mkdir .config
doctl auth init 

# linkar comandos
sudo snap connect doctl:kube-config

# configurar kubernetes da digital ocean
mkdir .kube
doctl kubernetes cluster kubeconfig save $cluster_name 

# instalar plugins de armazenamento
kubectl apply -f secret.yml
kubectl apply -fhttps://raw.githubusercontent.com/digitalocean/csi-digitalocean/master/deploy/kubernetes/releases/csi-digitalocean-v2.1.1/{crds.yaml,driver.yaml,snapshot-controller.yaml}

# iniciar aplicação
kubectl apply -f pvc.yml
kubectl apply -f configmap.yml
kubecrl apply -f clusterIP.yml
kubectl apply -f statefulset.yml
kubectl apply -f loadBalancer.yml
kubectl apply -f deployment.yml
kubectl apply -f hpa.yml
