provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_providers {
    aws = "~> 3.74"
  }
}
