resource "aws_eip" "eip" {
  tags = {
    Name = "MYeip"
  }
  depends_on = [

    aws_route_table_association.Unity1
  ]
}