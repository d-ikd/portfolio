/* ===============route53================ */
/* Frontend: DetasourceDefinition of HostZone */
resource "aws_route53_zone" "cs-zone" {
  name = "realshinkitv.com"
  tags = {
    "portfolio" = "realshinkitv.com"
  }
}

/* Backend: DetasourceDefinition of HostZone */
resource "aws_route53_zone" "cs-host-zone" {
  name    = "realchinkitv.com"
  comment = "realchinkitv.com host zone"
}

/* Frontend: Definition of DNS Record of ALB */
resource "aws_route53_record" "cs-zone-record" {
  zone_id = aws_route53_zone.cs-zone.id
  name    = aws_route53_zone.cs-zone.name
  type    = "A"

  alias {
    name                   = aws_lb.cs-frontend-alb.dns_name
    zone_id                = aws_lb.cs-frontend-alb.zone_id
    evaluate_target_health = true
  }
}

/* Backend: Definition of DNS Record of ALB */
resource "aws_route53_record" "cs-host-zone-record" {
  zone_id = aws_route53_zone.cs-host-zone.zone_id
  name    = aws_route53_zone.cs-host-zone.name
  type    = "A"

  alias {
    name                   = aws_lb.cs-backend-alb.dns_name
    zone_id                = aws_lb.cs-backend-alb.zone_id
    evaluate_target_health = true
  }
}
/* ===============route53================ */



/* =================ACM=================== */
/* Definition of SSL証明書 */

/* Frontend: Definition of SSL証明書 */
resource "aws_acm_certificate" "cs-frontend-acm" {
  domain_name               = aws_route53_record.cs-zone-record.name
  subject_alternative_names = ["*.realshinkitv.com", ]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "Frontend: realshinkitv.com"
  }
}

/* Backend: Definition of SSL証明書 */
resource "aws_acm_certificate" "cs-backend-acm" {
  domain_name               = aws_route53_record.cs-host-zone-record.name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "Backend: realchinkitv.com"
  }
}

/* Definition of Record for ValidationOfSSL証明書 */
resource "aws_route53_record" "cs-certificate" {
  name    = tolist(aws_acm_certificate.cs-backend-acm.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.cs-backend-acm.domain_validation_options)[0].resource_record_type
  records = [tolist(aws_acm_certificate.cs-backend-acm.domain_validation_options)[0].resource_record_value]
  zone_id = aws_route53_zone.cs-host-zone.id
  ttl     = 60
}

/* Waiting for FinishOfValidation */
resource "aws_acm_certificate_validation" "cs-backend-acm" {
  certificate_arn         = aws_acm_certificate.cs-backend-acm.arn
  validation_record_fqdns = [aws_route53_record.cs-certificate.fqdn]
}

/* ========================================== */

# #for_eachを使用、Route53を使用したDNS検証
# # Backend
# resource "aws_acm_certificate" "cs-backend-acm" {
#   domain_name       = "realchinkitv.com"
#   validation_method = "DNS"
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Frontend
# resource "aws_acm_certificate" "cs-frontend-acm" {
#   domain_name       = "realshinkitv.com"
#   validation_method = "DNS"
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_route53_record" "cs-backend-certificate" {
#   for_each = {
#     for dvo in aws_acm_certificate.cs-backend-acm.domain_validation_options : dvo.domain_name => {
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
#   zone_id         = aws_route53_zone.cs-host-zone.zone_id
# }

# resource "aws_acm_certificate_validation" "cs-backend-acm" {
#   certificate_arn         = aws_acm_certificate.cs-backend-acm.arn
#   validation_record_fqdns = [for record in aws_route53_record.cs-backend-certificate : record.fqdn]
# }


# resource "aws_route53_record" "cs-frontend-certificate" {
#   for_each = {
#     for dvo in aws_acm_certificate.cs-frontend-acm.domain_validation_options : dvo.domain_name => {
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
#   zone_id         = aws_route53_zone.cs-zone.zone_id
# }

# resource "aws_acm_certificate_validation" "cs-frontend-acm" {
#   certificate_arn         = aws_acm_certificate.cs-frontend-acm.arn
#   validation_record_fqdns = [for record in aws_route53_record.cs-frontend-certificate : record.fqdn]
# }
