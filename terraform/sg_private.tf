# data "aws_security_group" "public_ec2_SG" {
#   name = "public_ec2_SG"  
# }

resource "aws_security_group" "private_ec2_SG" {
  name   = "private_ec2_SG"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description     = "SSH from public subnet"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["public_ec2_SG"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_ec2_SG"
  }

  depends_on = [
    aws_security_group.public_ec2_SG
  ]
}
