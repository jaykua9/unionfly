resource "aws_nat_gateway" "natGATEWAY" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publicsubnet.id

  tags = {
    Name = "natGATEWAY"
  }

  depends_on = [
    aws_eip.eip
  ]
}