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
