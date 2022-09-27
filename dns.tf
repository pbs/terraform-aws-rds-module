resource "aws_route53_record" "dns_record" {
  count   = var.create_dns ? 1 : 0
  zone_id = local.private_hosted_zone
  name    = "${local.name}-db"
  type    = "CNAME"
  ttl     = var.dns_ttl
  records = [aws_rds_cluster.db.endpoint]
}
