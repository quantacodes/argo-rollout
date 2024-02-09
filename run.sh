#/bin/bash
export KUBECONFIG=/Users/saura/Projects/k8s/do_infra/terraform-digitalocean-k8s/kubeconfig_do
/Users/saura/Projects/k8s/argo-rollout/istio-1.20.2/bin/istioctl install --set profile=default -y
kubectl label namespace default istio-injection=enabled
echo "installinf dep"
kubectl apply -f /Users/saura/Projects/k8s/argo-rollout/istio-1.20.2/samples/addons/prometheus.yaml
kubectl apply -f /Users/saura/Projects/k8s/argo-rollout/istio-1.20.2/samples/addons/kiali.yaml
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml