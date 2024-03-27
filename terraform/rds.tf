resource "aws_db_instance" "myrdsinstance" {
  engine               = "mysql"
  identifier           = "myrdsinstance"
  allocated_storage    =  20
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "myrdsuser"
  password             = "myrdspassword"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  false
}

resource "local_file" "rds_credentials" {
  filename = "/rds_credentials.txt"

  content = <<-EOT
    rds_username = "${aws_db_instance.myrdsinstance.username}"
    rds_password = "${aws_db_instance.myrdsinstance.password}"
  EOT
}