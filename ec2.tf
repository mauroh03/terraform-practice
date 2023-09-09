resource "aws_instance" "ec2_test" {
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = data.aws_key_pair.public_key.key_name

  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    command = "echo instancia creada con la IP ${aws_instance.ec2_test.public_ip} >> datos_instancia.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo instancia ${self.public_ip} destruida >> datos_instancia.txt"
  }
}
