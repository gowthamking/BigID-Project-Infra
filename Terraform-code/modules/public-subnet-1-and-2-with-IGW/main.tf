resource "aws_subnet" "pub-sub-1" {
  vpc_id = var.vpc_id
  cidr_block = var.pub-subnet1_cidr
  availability_zone = var.pub-subnet_1_az
  map_public_ip_on_launch = "true"

  tags = {
    Name = "wiki-pub-sub-1"
  }
}


resource "aws_subnet" "pub-sub-2" {
  vpc_id = var.vpc_id
  cidr_block = var.pub-subnet2_cidr
  availability_zone = var.pub-subnet_2_az
  map_public_ip_on_launch = "true"

  tags = {
    Name = "wiki-pub-sub-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    "Name" = "cus-ig"
  }
}

resource "aws_route" "rt-igw" {
  route_table_id = var.vpc_rt_id
  destination_cidr_block = var.igw_route
  gateway_id = aws_internet_gateway.igw.id
}