output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --name ${aws_eks_cluster.eks.name} --region ${var.region}"
}
