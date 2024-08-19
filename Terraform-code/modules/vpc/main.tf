
resource "aws_vpc" "wiki-vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Custom-wiki-VPC"
  }
}