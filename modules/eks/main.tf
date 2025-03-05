resource "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids = var.private_subnets
  }
}

# EKS Worker Nodes
resource "aws_eks_node_group" "eks_nodes" {
  cluster_name  = aws_eks_cluster.eks.name
  node_group_name = "eks-worker-nodes"
  node_role_arn  = aws_iam_role.worker_role.arn
  subnet_ids = var.private_subnets
  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 2
  }
}

output "eks_cluster_endpoint" { value = aws_eks_cluster.eks.endpoint }
