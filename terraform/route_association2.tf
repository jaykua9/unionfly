resource "aws_route_table_association" "association2" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.route2.id

  depends_on = [
    aws_route_table.route2
  ]
}
