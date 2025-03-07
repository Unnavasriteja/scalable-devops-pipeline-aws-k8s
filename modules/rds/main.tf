# 🚀 1. Store Database Credentials in AWS Secrets Manager
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

# 🚀 2. Fetch RDS Credentials from Secrets Manager
data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = aws_secretsmanager_secret.rds_secret.id
}

# 🚀 3. Create the RDS Database Instance (Optimized for HA & Low Cost)
resource "aws_db_instance" "rds" {
  identifier              = var.db_identifier
  allocated_storage       = var.db_allocated_storage  # Reduced for cost savings
  max_allocated_storage   = var.db_max_allocated_storage  # Allows scaling when needed
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class  # Using t3.small for cost optimization
  multi_az               = true  # Keeping HA enabled
  storage_encrypted      = true
  publicly_accessible    = false
  backup_retention_period = var.db_backup_retention_period  # Reduced to 3 days
  monitoring_interval     = var.db_monitoring_interval  # Disabled enhanced monitoring

  # Retrieve credentials from AWS Secrets Manager
  username = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["password"]

  # Network Configuration
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}

# 🚀 4. Security Group for RDS (Restricts Access)
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 🚀 5. CloudWatch Alarm for High CPU Usage
resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  metric_name         = "CPUUtilization"
  threshold          = 80
  alarm_actions = [var.cloudwatch_alarm_arn]
}
