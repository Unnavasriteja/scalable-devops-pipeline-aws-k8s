resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine              = "postgres"
  engine_version      = "15"
  instance_class      = "db.t3.micro"
  username           = "admin"
  password           = "password123"
  publicly_accessible = false
}
