#!/bin/bash
export KUBECONFIG=/Users/saura/Projects/k8s/do_infra/terraform-digitalocean-k8s/kubeconfig_do
##Installing Argo-Rollouts
Echo "Installing Argo-Rollouts"
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://raw.githubusercontent.com/argoproj/argo-rollouts/stable/manifests/install.yaml