resource "aws_subnet" "privatesubnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet"
  }
  depends_on = [
    aws_subnet.publicsubnet
  ]
}