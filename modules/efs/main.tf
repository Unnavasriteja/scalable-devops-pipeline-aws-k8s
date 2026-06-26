resource "aws_efs_file_system" "app_efs" {
  creation_token = "app-efs-storage"
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "efs_mount" {
  file_system_id = aws_efs_file_system.app_efs.id
  subnet_id      = var.private_subnet
}

output "efs_id" { value = aws_efs_file_system.app_efs.id }
