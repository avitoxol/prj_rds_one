resource "aws_key_pair" "mykp" {
    key_name   = "mykp"
    public_key = file(var.ssh_key)
}

resource "aws_instance" "my_ec2" {
  ami = data.aws_ami.my_image.id
  instance_type = var.type[2]
  vpc_security_group_ids = [aws_security_group.websg.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.mykp.key_name
  subnet_id = aws_default_subnet.defsub.id

  user_data = <<-EOF
                    yum install httpd -y
                    chkconfig httpd on
                    yum update -y
                    shutdown -r now
  EOF

  depends_on = [
    aws_db_instance.mydb
  ]

  tags = {
    Name = "my_ec2"
  }
}
