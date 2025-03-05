resource "aws_eks_cluster" "eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.private_subnets
  }
}

output "eks_cluster_id" {
  value = aws_eks_cluster.eks.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
