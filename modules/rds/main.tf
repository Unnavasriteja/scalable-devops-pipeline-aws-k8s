# 1. Store Database Credentials Securely in AWS Secrets Manager
resource "aws_secretsmanager_secret" "rds_secret" {
  name = "rds-credentials"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "SuperSecureP@ssword123!"
  })
}

# 2. Fetch RDS Credentials from Secrets Manager
data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = aws_secretsmanager_secret.rds_secret.id
}

# 3. Create the Multi-AZ Primary RDS Instance
resource "aws_db_instance" "rds" {
  identifier              = var.db_identifier
  allocated_storage       = var.db_allocated_storage
  max_allocated_storage   = var.db_max_allocated_storage
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  multi_az               = true  # Ensures HA (Automatic Failover)
  storage_encrypted      = true
  publicly_accessible    = false
  backup_retention_period = var.db_backup_retention_period
  deletion_protection     = true # Prevents accidental deletion

  # Fetch credentials dynamically from AWS Secrets Manager
  username = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["password"]

  # Enable PostgreSQL Error & Slow Query Logging
  parameter_group_name = aws_db_parameter_group.rds_logs.name

  # Enable CloudWatch Monitoring
  monitoring_interval = 60  

  #  Disable Performance Insights to save cost
  performance_insights_enabled = false

  # Network Configuration
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}

# 4. Read Replicas for Load Balancing
resource "aws_db_instance" "rds_read_replica_1" {
  identifier              = "${var.db_identifier}-read-replica-1"
  instance_class         = var.db_instance_class_read_replica
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  publicly_accessible    = false
  storage_encrypted      = true
  replicate_source_db    = aws_db_instance.rds.identifier
  monitoring_interval    = 60  
  allocated_storage      = var.db_allocated_storage
  max_allocated_storage  = var.db_max_allocated_storage

  depends_on = [aws_db_instance.rds]
}

# 5. Create Route 53 Read Load Balancer
resource "aws_route53_record" "rds_read_balancer" {
  zone_id = var.route53_zone_id
  name    = "read.mydb.example.com"
  type    = "CNAME"
  ttl     = 60

  records = [
    aws_db_instance.rds_read_replica_1.endpoint
  ]
}

# 6. PostgreSQL Logging Parameter Group
resource "aws_db_parameter_group" "rds_logs" {
  name   = "rds-logs-pg"
  family = "postgres15"

  parameter {
    name  = "log_min_duration_statement"
    value = "500"  # Logs queries that take longer than 500ms
  }

  parameter {
    name  = "log_statement"
    value = "all"
  }
}

# 7. Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow database access from EKS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_sg.id]
  }
}

# 8. CloudWatch Alarms for Performance
resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "CPUUtilization"
  threshold          = 80
  alarm_actions = [var.cloudwatch_alarm_arn]
}

resource "aws_cloudwatch_metric_alarm" "rds_low_memory" {
  alarm_name          = "rds-low-memory"
  comparison_operator = "LessThanThreshold"
  metric_name         = "FreeableMemory"
  threshold          = 256000000  # 256MB threshold
  alarm_actions      = [var.cloudwatch_alarm_arn]
}
