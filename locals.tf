locals {
  name = var.name != null ? var.name : var.product

  cluster_identifier        = var.use_prefix ? null : local.name
  cluster_identifier_prefix = var.use_prefix ? "${local.name}-" : null

  vpc_id              = var.vpc_id != null ? var.vpc_id : data.aws_vpc.vpc[0].id
  private_subnets     = var.private_subnets != null ? var.private_subnets : data.aws_subnets.private_subnets[0].ids
  private_hosted_zone = var.create_dns ? data.aws_route53_zone.private_hosted_zone[0].zone_id : null
  availability_zones  = var.availability_zones != null ? var.availability_zones : slice(data.aws_availability_zones.available[0].names, 0, 3) # We take the slice here because we can only specify 3 AZs

  db_admin_password = var.db_admin_password != null ? var.db_admin_password : random_password.password.result

  engine_version = var.engine_version != null ? var.engine_version : data.aws_rds_engine_version.engine_version[0].version

  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )
}
