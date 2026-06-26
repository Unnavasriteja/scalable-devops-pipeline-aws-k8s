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

output "oidc_provider_arn" {
  description = "OIDC provider ARN for IRSA"
  value       = aws_iam_openid_connect_provider.eks_oidc.arn
}

output "oidc_provider_url" {
  description = "OIDC provider URL (without https://) for IRSA"
  value       = replace(aws_eks_cluster.eks.identity[0].oidc[0].issuer, "https://", "")
}
