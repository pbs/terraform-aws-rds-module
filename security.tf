resource "aws_security_group" "sg" {
  description = "Controls access to the ${local.name} DB"
  vpc_id      = local.vpc_id
  name_prefix = "${local.name}-db-sg-"

  tags = {
    Name        = "${local.name} DB SG"
    application = var.product
    environment = var.environment
    creator     = local.creator
  }
}

resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.sg.id
  description       = "Allow all traffic out"
  type              = "egress"
  protocol          = "-1"

  from_port = 0
  to_port   = 0

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}
