Test environment, that I'm using for https://github.com/marynik/mindbox

Needs the .tfvars file with secrets for connecting AWS:
```
access_key = ""
secret_key = ""
```
Consists of Terraform files, creating AWS EKS cluster with 3 zones and 5 nodes.

The command for connecting the cluster you can find in the output after applying.
