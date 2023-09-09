variable "virginia_cidir" {
  description = "CIDR Virginia"
  type        = string
  sensitive   = true
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type        = string
# }

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "prject tags"
  type        = map(string)
}

variable "ec2_specs" {
  description = "instance parameters"
  type        = map(string)
}

variable "access_key" {

}

variable "secret_key" {

}
