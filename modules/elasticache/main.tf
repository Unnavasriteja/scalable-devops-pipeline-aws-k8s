resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.elasticache_cluster_id
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.redis7"
  port                 = 6379
}

output "elasticache_endpoint" { value = aws_elasticache_cluster.redis.cache_nodes[0].address }
