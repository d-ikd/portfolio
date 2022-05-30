variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "DATABASE_URL" {}
variable "RAILS_MASTER_KEY" {}
variable "RAILS_ADMIN_USER" {}
variable "RAILS_ADMIN_ADDRESS" {}
variable "RAILS_ADMIN_KEY" {}
variable "RAILS_GUEST_USER" {}
variable "RAILS_GUEST_ADDRESS" {}
variable "RAILS_GUEST_KEY" {}
variable "RAILS_FOLLOWUSER_KEY" {}

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

resource "aws_ssm_parameter" "rails_admin_user" {
  name        = "rails_admin_user"
  value       = var.RAILS_ADMIN_USER
  type        = "SecureString"
  description = "RAILS_ADMIN_USER"
}

resource "aws_ssm_parameter" "rails_admin_address" {
  name        = "rails_admin_address"
  value       = var.RAILS_ADMIN_ADDRESS
  type        = "SecureString"
  description = "RAILS_ADMIN_ADDRESS"
}

resource "aws_ssm_parameter" "rails_admin_key" {
  name        = "rails_admin_key"
  value       = var.RAILS_ADMIN_KEY
  type        = "SecureString"
  description = "RAILS_ADMIN_KEY"
}

resource "aws_ssm_parameter" "rails_guest_user" {
  name        = "rails_guest_user"
  value       = var.RAILS_GUEST_USER
  type        = "SecureString"
  description = "RAILS_GUEST_USER"
}

resource "aws_ssm_parameter" "rails_guest_address" {
  name        = "rails_guest_address"
  value       = var.RAILS_GUEST_ADDRESS
  type        = "SecureString"
  description = "RAILS_GUEST_ADDRESS"
}

resource "aws_ssm_parameter" "rails_guest_key" {
  name        = "rails_guest_key"
  value       = var.RAILS_GUEST_KEY
  type        = "SecureString"
  description = "RAILS_GUEST_KEY"
}

resource "aws_ssm_parameter" "rails_followuser_key" {
  name        = "rails_followuser_key"
  value       = var.RAILS_FOLLOWUSER_KEY
  type        = "SecureString"
  description = "RAILS_FOLLOWUSER_KEY"
}
