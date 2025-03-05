output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.eks.id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_worker_nodes" {
  description = "EKS Worker Node Group ID"
  value       = aws_eks_node_group.eks_nodes.id
}
