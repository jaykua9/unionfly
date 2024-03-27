# data "aws_security_group" "public_ec2_SG" {
#   name = "public_ec2_SG"  
# }

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
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
    Name = "rds_SG"
  }

  depends_on = [
    aws_security_group.public_ec2_SG
  ]
}