output "name" {
  description = "Name of the DB"
  value       = module.rds.name
}

output "db_admin_username" {
  description = "Admin Username for DB"
  value       = module.rds.db_admin_username
}

output "db_admin_password" {
  description = "Admin password for DB"
  value       = module.rds.db_admin_password
  sensitive   = true
}

output "db_cluster_dns" {
  description = "DB Cluster private DNS record"
  value       = module.rds.db_cluster_dns
}

output "sg_id" {
  description = "Security group ID for DB"
  value       = module.rds.sg_id
}
