# Test Task: Web App Deployment in Kubernetes

This is a solution for deploying a web application in a Kubernetes cluster.

## Includes

- [x] `allin.yaml` — full manifest with comments
- [x] Helm chart with the same manifests
- [x] Terraform — creates an AWS EKS cluster and installs the app using Helm chart

## What you get

Nginx as the sample web app with:
- pods distribution across zones
- handling slow startup (5-10 sec)
- scales based on daily load pattern
- high CPU on startup, low during steady state
- balance berween resilience and resource consumption

The K8s cluster with:
- 5 nodes, evenly-distributed in 3 zones
- Ingress/Nginx controller

## How to check
To get nodes with zones
```
kubectl get nodes -L topology.kubernetes.io/zone
```
To get the pods
```
kubectl get pods
```
To see the connection between pods and service
```
kubectl describe ingress
```
Use the value from "Address" field instead of <EXTERNAL-IP> to get the Nginx web app welcome page:
```
curl -v <EXTERNAL-IP> -H "Host:my-app.example.com"
```


## How to Deploy

### ✅ Option 1: You already have a Kubernetes cluster

#### ➤ Deploy using plain YAML
```
kubectl apply -f allin.yaml
```
or
#### ➤ Deploy using Helm chart
```
helm install web-app-release ./mychart
```
### ✅ Option 2: No cluster? Deploy everything with Terraform (AWS EKS)

Requires: AWS CLI, Terraform, kubectl, Helm.

Add the secrets.auto.tfvars file with secrets for connecting AWS:
```
access_key = "your_access_key"
secret_key = "your_secret_key"
```
Run
```
terarform init
terraform apply
```

Use the kubeconfig_command from the output to connect to the cluster.

## How to Uninstall

#### ➤ If you used using plain YAM
```
kubectl apply -f allin.yaml
```
#### ➤ If you used Helm chart
```
helm uninstall web-app-release
```
#### ➤ If you used Terraform
```
terraform destroy
```

