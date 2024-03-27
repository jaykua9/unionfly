resource "aws_route_table" "route2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGATEWAY.id
  }

  tags = {
    Name = "RouteTable2"
  }

  depends_on = [
    aws_nat_gateway.natGATEWAY
  ]
}
