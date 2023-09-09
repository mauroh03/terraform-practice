virginia_cidir = "10.10.0.0/16"
# public_subnet  = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "dev"
  "owner"       = "mauro"
  "iac"         = "terraform"
  "iac_version" = "1.4.4"
}
ec2_specs = {
  "ami"           = "ami-051f7e7f6c2f40dc1"
  "instance_type" = "t2.micro"
}
