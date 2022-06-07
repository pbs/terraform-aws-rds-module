resource "aws_route53_record" "dns_record" {
  count   = var.create_dns ? 1 : 0
  zone_id = local.private_hosted_zone
  name    = "${local.name}-db"
  type    = "A"
  alias {
    name                   = aws_rds_cluster.db.endpoint
    zone_id                = aws_rds_cluster.db.hosted_zone_id
    evaluate_target_health = var.dns_evaluate_target_health
  }
}
