# Test Task: Web App Deployment in Kubernetes

This is a solution for deploying a web application in a Kubernetes cluster.

## Includes

- [x] `allin.yaml` — full manifest with comments
- [x] Helm chart with the same manifests
- [x] Terraform — creates an AWS EKS cluster and installs the app using Helm chart

## What you get

Nginx as a sample web app with:
- pods distribution across zones
- handling slow startup (5-10 sec)
- scales based on daily load pattern
- low CPU during steady state, with ability to get more if needed
- balance berween resilience and resource consumption

The K8s cluster with:
- 5 nodes, evenly-distributed in 3 zones
- Ingress/Nginx controller

## How to check
![til](https://github.com/marynik/aws-test-env/blob/main/demo/demo.gif)
Check your browser while port-forwarding:
![til](https://github.com/marynik/aws-test-env/blob/main/demo/localhost_screenshot.png)
Check scaling:
![til](https://github.com/marynik/aws-test-env/blob/main/demo/demo2.gif)

To get nodes with zones:
```
kubectl get nodes -L topology.kubernetes.io/zone
```
To get the pods:
```
kubectl get pods
```
To see the connection between pods and service:
```
kubectl describe ingress
```
Use the value from "Address" field instead of EXTERNAL-IP to get the Nginx web app welcome page:
```
curl -v EXTERNAL-IP -H "Host:my-app.example.com"
```
or run:
```
kubectl port-forward svc/my-web-app-service 8080:80
```
and check the http://localhost:8080 in your browser to see the Nginx web app welcome page.

To check scaling up:
```
kubectl create job --from=cronjob/scale-up-my-web-app manual-scale-up
kubectl get pods -o wide -w
```
To check scaling down:
```
kubectl create job --from=cronjob/scale-down-my-web-app manual-scale-down
kubectl get pods -o wide -w
```

## How to Deploy

### Option 1: You already have a Kubernetes cluster

#### Deploy using plain YAML
```
kubectl apply -f allin.yaml
```
or
#### Deploy using Helm chart
```
helm install web-app-release ./mychart
```
### Option 2: No cluster? Deploy everything with Terraform (AWS EKS)

Requires: AWS CLI, Terraform, kubectl, Helm.

Add the secrets.auto.tfvars file with secrets for connecting AWS:
```
access_key = "your_access_key"
secret_key = "your_secret_key"
```
Run:
```
terarform init
terraform apply
```

Use the kubeconfig_command from the output to connect to the cluster.

## How to Uninstall

#### If you used plain YAML
```
kubectl delete -f allin.yaml
```
#### If you used Helm chart
```
helm uninstall web-app-release
```
#### If you used Terraform
```
terraform destroy
```

