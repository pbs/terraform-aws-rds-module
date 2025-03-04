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

output "db_administration_dns" {
  description = "DNS endpoint for performing administrative tasks on the database, i.e. the non-proxy writer endpoint for the cluster"
  value       = aws_rds_cluster.db.endpoint
}

output "sg_id" {
  description = "Security group ID for DB. If use_proxy is true, this is the proxy SG, otherwise it's the cluster's security group"
  value       = local.sg_id
}

output "administration_sg_id" {
  description = "The security group id for performing administrative tasks on the database. If use_proxy is false, this is the same as sg_id"
  value       = aws_security_group.sg.id
}
