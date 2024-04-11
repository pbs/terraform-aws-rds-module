resource "aws_rds_cluster_instance" "writer" {
  cluster_identifier = aws_rds_cluster.db.id
  identifier         = "${local.name}-instance-1"
  instance_class     = var.instance_class
  apply_immediately  = var.apply_immediately
  engine             = var.engine
  engine_version     = local.engine_version

  tags = local.tags
}

resource "aws_rds_cluster_instance" "reader" {
  count              = var.reader_count
  cluster_identifier = aws_rds_cluster.db.id
  identifier         = "${local.name}-instance-${count.index + 2}"
  instance_class     = var.instance_class
  apply_immediately  = var.apply_immediately
  engine             = var.engine
  engine_version     = local.engine_version

  tags = local.tags
}
