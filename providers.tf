terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.13.0"
    }
  }
  required_version = "~>1.4.0"
}

provider "aws" {
  region = "us-east-1"
  alias  = "personal"
  default_tags {
    tags = var.tags
  }
}
