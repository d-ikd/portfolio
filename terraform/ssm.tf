variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "DATABASE_URL" {}
variable "RAILS_MASTER_KEY" {}

resource "aws_ssm_parameter" "access_key_id" {
  name        = "access_key_id"
  value       = var.AWS_ACCESS_KEY_ID
  type        = "SecureString"
  description = "AWS_ACCESS_KEY_ID"
}

resource "aws_ssm_parameter" "secret_access_key" {
  name        = "secret_access_key"
  value       = var.AWS_SECRET_ACCESS_KEY
  type        = "SecureString"
  description = "AWS_SECRET_ACCESS_KEY"
}

resource "aws_ssm_parameter" "portfolio_database_url" {
  name        = "portfolio_database_url"
  value       = var.DATABASE_URL
  type        = "SecureString"
  description = "DATABASE_URL"
}

resource "aws_ssm_parameter" "portfolio_rails_master_key" {
  name        = "portfolio_rails_master_key"
  value       = var.RAILS_MASTER_KEY
  type        = "SecureString"
  description = "RAILS_MASTER_KEY"
}
