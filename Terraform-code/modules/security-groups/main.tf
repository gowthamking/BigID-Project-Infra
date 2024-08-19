resource "aws_security_group" "wiki-sg-ssh" {
  name = var.ssh-sg
  description = "Oppen pot 22"
  vpc_id = var.vpc_id
tags = {
  Name = "SSH-SG"
}
  ingress  {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any source (0.0.0.0/0)
  }

  ingress  {
    description = "Jenkins port"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any source (0.0.0.0/0)
  }

  ingress  {
    description = ""
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any source (0.0.0.0/0)
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}