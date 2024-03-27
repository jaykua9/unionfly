resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "my-ssh-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "ssh_private_key" {
  filename        = "/private_key.pem"
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0400"
}

resource "null_resource" "copy_private_key" {
  provisioner "local-exec" {
    command = "scp -i /private_key.pem /private_key.pem ec2-user@${aws_instance.public_ec2.public_ip}:/private_key.pem"
  }
  depends_on = [local_file.ssh_private_key]
}

