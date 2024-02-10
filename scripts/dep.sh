#!/bin/bash
export KUBECONFIG=/Users/saura/Projects/k8s/do_infra/terraform-digitalocean-k8s/kubeconfig_do
##Installing Istio
/Users/saura/Projects/k8s/argo-rollout/istio-1.20.2/bin/istioctl install --set profile=default -y  || :
kubectl label namespace default istio-injection=enabled
##Installing Dep
echo "Installing Dep"
kubectl apply -f /Users/saura/Projects/k8s/argo-rollout/istio-1.20.2/samples/addons/prometheus.yaml
kubectl apply -f /Users/saura/Projects/k8s/argo-rollout/istio-1.20.2/samples/addons/kiali.yaml

##Installing ArgoCd 
kubectl create namespace argocd || :
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

