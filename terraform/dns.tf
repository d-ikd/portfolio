/* ===============route53================ */
/* Frontend: DetasourceDefinition of HostZone */
resource "aws_route53_zone" "portfolio-zone" {
  name = "stuctive.link"
  tags = {
    "portfolio" = "stuctive.link"
  }
}

/* Backend: DetasourceDefinition of HostZone */
resource "aws_route53_zone" "portfolio-host-zone" {
  name    = "shinki.link"
  comment = "shinki.link host zone"
}

/* Frontend: Definition of DNS Record of ALB */
resource "aws_route53_record" "portfolio-zone-record" {
  zone_id = aws_route53_zone.portfolio-zone.id
  name    = aws_route53_zone.portfolio-zone.name
  type    = "A"

  alias {
    name                   = aws_lb.portfolio-frontend-alb.dns_name
    zone_id                = aws_lb.portfolio-frontend-alb.zone_id
    evaluate_target_health = true
  }
}

/* Backend: Definition of DNS Record of ALB */
resource "aws_route53_record" "portfolio-host-zone-record" {
  zone_id = aws_route53_zone.portfolio-host-zone.zone_id
  name    = aws_route53_zone.portfolio-host-zone.name
  type    = "A"

  alias {
    name                   = aws_lb.portfolio-backend-alb.dns_name
    zone_id                = aws_lb.portfolio-backend-alb.zone_id
    evaluate_target_health = true
  }
}
/* ===============route53================ */



/* =================ACM=================== */
/* Definition of SSL証明書 */

/* Frontend: Definition of SSL証明書 */
resource "aws_acm_certificate" "portfolio-frontend-acm" {
  domain_name               = aws_route53_record.portfolio-zone-record.name
  subject_alternative_names = ["*.stuctive.link", ]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "Frontend: stuctive.link"
  }
}

/* Backend: Definition of SSL証明書 */
resource "aws_acm_certificate" "portfolio-backend-acm" {
  domain_name               = aws_route53_record.portfolio-host-zone-record.name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "Backend: shinki.link"
  }
}

/* Definition of Record for ValidationOfSSL証明書 */
resource "aws_route53_record" "portfolio-certificate" {
  name    = tolist(aws_acm_certificate.portfolio-backend-acm.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.portfolio-backend-acm.domain_validation_options)[0].resource_record_type
  records = [tolist(aws_acm_certificate.portfolio-backend-acm.domain_validation_options)[0].resource_record_value]
  zone_id = aws_route53_zone.portfolio-host-zone.id
  ttl     = 60
}

/* Waiting for FinishOfValidation */
resource "aws_acm_certificate_validation" "portfolio-backend-acm" {
  certificate_arn         = aws_acm_certificate.portfolio-backend-acm.arn
  validation_record_fqdns = [aws_route53_record.portfolio-certificate.fqdn]
}

/* ========================================== */

# #for_eachを使用、Route53を使用したDNS検証
# # Backend
# resource "aws_acm_certificate" "portfolio-backend-acm" {
#   domain_name       = "shinki.link"
#   validation_method = "DNS"
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Frontend
# resource "aws_acm_certificate" "portfolio-frontend-acm" {
#   domain_name       = "stuctive.link"
#   validation_method = "DNS"
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_route53_record" "portfolio-backend-certificate" {
#   for_each = {
#     for dvo in aws_acm_certificate.portfolio-backend-acm.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = aws_route53_zone.portfolio-host-zone.zone_id
# }

# resource "aws_acm_certificate_validation" "portfolio-backend-acm" {
#   certificate_arn         = aws_acm_certificate.portfolio-backend-acm.arn
#   validation_record_fqdns = [for record in aws_route53_record.portfolio-backend-certificate : record.fqdn]
# }


# resource "aws_route53_record" "portfolio-frontend-certificate" {
#   for_each = {
#     for dvo in aws_acm_certificate.portfolio-frontend-acm.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = aws_route53_zone.portfolio-zone.zone_id
# }

# resource "aws_acm_certificate_validation" "portfolio-frontend-acm" {
#   certificate_arn         = aws_acm_certificate.portfolio-frontend-acm.arn
#   validation_record_fqdns = [for record in aws_route53_record.portfolio-frontend-certificate : record.fqdn]
# }
