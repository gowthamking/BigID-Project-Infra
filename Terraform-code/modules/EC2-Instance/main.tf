resource "aws_instance" "EC2-Server" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_file
  vpc_security_group_ids = var.sg_id
  subnet_id = var.pub_sub-1
  associate_public_ip_address = true
  tags = {
    Name = var.server_name
  }
}

