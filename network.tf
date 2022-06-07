resource "aws_db_subnet_group" "subnet_group" {
  name_prefix = "${local.name}-db-subnet-group-"
  subnet_ids  = local.private_subnets

  tags = {
    Name        = "${local.name} DB SG Group"
    application = var.product
    environment = var.environment
    creator     = local.creator
  }
}
