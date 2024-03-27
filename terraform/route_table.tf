resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "RouteTable1"

  }

  depends_on = [
    aws_vpc.vpc,
    aws_internet_gateway.gateway,
    aws_subnet.publicsubnet
  ]
}
