resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidir
  tags = {
    Name = "VPC_VIRGINIA"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private_subnet"
  }

  depends_on = [
    aws_subnet.public_subnet
  ]
}

module "module_s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "module-bucket-nombre-unico1234567891011"
}

module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version     = "1.1.1"
  namespace   = "example"
  stage       = "dev"
  name        = "terraform"
  attributes  = ["state"]
  environment = "us-east-1"

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}
