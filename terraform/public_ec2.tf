
resource "aws_instance" "public_ec2" {
  ami           = "ami-031134f7a79b6e424"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.publicsubnet.id
  key_name = aws_key_pair.ssh_key_pair.key_name
  
  vpc_security_group_ids = [

    aws_security_group.public_ec2_SG.id
  ]

  tags = {
    Name = "public_ec2"
  }

  depends_on = [
    aws_instance.private_ec2
  ]
}
