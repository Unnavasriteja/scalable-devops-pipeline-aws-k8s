output "efs_id" {
  description = "EFS File System ID"
  value       = aws_efs_file_system.app_efs.id
}

output "efs_mount_target" {
  description = "EFS Mount Target ID"
  value       = aws_efs_mount_target.efs_mount.id
}
