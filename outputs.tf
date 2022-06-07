output "name" {
  description = "Name of the DB"
  value       = aws_rds_cluster.db.id
}

output "db_admin_username" {
  description = "Admin username for DB"
  value       = var.db_admin_username
}

output "db_admin_password" {
  description = "Admin password for DB"
  value       = random_password.password.result
  sensitive   = true
}

output "db_cluster_dns" {
  description = "DB Cluster private DNS record"
  value       = var.create_dns ? aws_route53_record.dns_record[0].fqdn : aws_rds_cluster.db.endpoint
}

output "sg_id" {
  description = "Security group ID for DB"
  value       = aws_security_group.sg.id
}
