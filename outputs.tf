output "vpc_ohio_arn" {
  value       = aws_vpc.vpc_virginia.arn
  description = "ARN of virginia vpc"
}

output "ec2_public_ip" {
  description = "instance public ip"
  value       = aws_instance.ec2_test.public_ip
}
