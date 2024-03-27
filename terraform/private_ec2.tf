resource "aws_instance" "private_ec2" {
  ami           = "ami-031134f7a79b6e424"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.privatesubnet.id
  key_name      = aws_key_pair.ssh_key_pair.key_name

  vpc_security_group_ids = [
    aws_security_group.private_ec2_SG.id
  ]

  tags = {
    Name = "private_ec2"
  }


}
