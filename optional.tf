variable "name" {
  description = "Name of the RDS Module. If null, will default to product."
  default     = null
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  default     = null
  type        = string
}

variable "private_subnets" {
  description = "Private subnets"
  default     = null
  type        = list(string)
}

variable "db_admin_username" {
  description = "Admin username for the DB"
  default     = "admin"
  type        = string
}

variable "db_admin_password" {
  description = "Admin password for the DB"
  default     = null
  type        = string
}

variable "use_prefix" {
  description = "Create bucket with prefix instead of explicit name"
  default     = true
  type        = bool
}

variable "engine" {
  description = "Engine to use for the DB"
  default     = "aurora-mysql"
  type        = string
}

variable "engine_mode" {
  description = "Engine mode of the RDS cluster"
  default     = "provisioned"
  type        = string
  validation {
    condition     = var.engine_mode != "serverless"
    error_message = "This module does not support Aurora Serverless v1. Please switch to Aurora Serverless v2 instead by leaving this value set to the default value."
  }
}

variable "engine_version" {
  description = "Engine version of the RDS cluster. If null, one will be looked up based on preferred versions."
  default     = null
  type        = string
}

variable "engine_preferred_versions" {
  description = "Engine preferred versions of the RDS cluster"
  default     = ["8.0.mysql_aurora.3.02.0"]
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones to be used by this RDS cluster"
  default     = null
  type        = list(string)
}


variable "backup_retention_period" {
  description = "Backup retention period"
  default     = 7
  type        = number
}

variable "enable_http_endpoint" {
  description = "Enable HTTP endpoint"
  default     = true
  type        = bool
}

variable "min_capacity" {
  description = "Minimum capacity for the cluster"
  default     = 0.5
  type        = number
}

variable "max_capacity" {
  description = "Maximum capacity for the cluster"
  default     = 16
  type        = number
}

variable "deletion_protection" {
  description = "Deletion protection"
  default     = true
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  default     = false
  type        = bool
}

variable "private_hosted_zone" {
  description = "Private hosted zone for account"
  default     = null
  type        = string
}

variable "create_dns" {
  description = "Whether to create a DNS record"
  default     = true
  type        = bool
}

variable "dns_ttl" {
  description = "TTL for DNS record"
  default     = 300
  type        = number
}

variable "instance_class" {
  description = "Instance class"
  default     = "db.serverless"
  type        = string
}

variable "apply_immediately" {
  description = "Apply changes immediately. If false, will apply updates during the next maintenance window."
  default     = false
  type        = bool
}

variable "reader_count" {
  description = "Number of reader instances to provision"
  default     = 1
  type        = number
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  default     = "04:00-04:30" # UTC, 00:00-00:30 ET
  type        = string
}

variable "preferred_maintenance_window" {
  description = "Preferred maintenance window"
  default     = "sun:05:00-sun:06:00" # UTC, 01:00-02:00 ET
  type        = string
}
