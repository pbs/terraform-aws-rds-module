output "name" {
  description = "Name of the DB"
  value       = aws_rds_cluster.db.id
}

output "db_admin_username" {
  description = "Admin username for DB"
  value       = var.db_admin_username
  sensitive   = true
}

output "db_admin_password" {
  description = "Admin password for DB"
  value       = random_password.password.result
  sensitive   = true
}

output "db_cluster_dns" {
  description = "Private DNS record for the DB Cluster endpoint (if create_dns is true, otherwise the endpoint itself)"
  value       = local.db_cluster_dns
}

output "db_cluster_reader_dns" {
  description = "Private DNS record for the DB Cluster reader endpoint (if create_dns is true, otherwise the endpoint itself)"
  value       = local.db_cluster_reader_dns
}

output "sg_id" {
  description = "Security group ID for DB"
  value       = local.sg_id
}
