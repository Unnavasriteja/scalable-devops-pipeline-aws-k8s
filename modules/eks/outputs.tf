output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.eks.id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API endpoint"
  value       = aws_eks_cluster.eks.endpoint
}
