resource "aws_route_table_association" "Unity1" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.route1.id
  depends_on = [
    aws_route_table.route1
  ]
}

