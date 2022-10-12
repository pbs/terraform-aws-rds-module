resource "aws_db_subnet_group" "subnet_group" {
  name_prefix = "${local.name}-db-subnet-group-"
  subnet_ids  = local.private_subnets

  tags = merge(
    local.tags,
    {
      Name = "${local.name} DB Subnet Group"
    }
  )
}
