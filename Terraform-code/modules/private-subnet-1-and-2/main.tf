resource "aws_subnet" "pri-sub-1" {
  vpc_id = var.vpc_id
  cidr_block = var.pri-subnet1_cidr
  availability_zone = var.pri-subnet_1_az

  tags = {
    Name = "wiki-pri-sub-1"
  }
}

resource "aws_subnet" "pri-sub-2" {
  vpc_id = var.vpc_id
  cidr_block = var.pri-subnet2_cidr
  availability_zone = var.pri-subnet_2_az

  tags = {
    Name = "wiki-pri-sub-2"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = "wiki-private-rt"
  }
  }

  resource "aws_route_table_association" "associate-pri-sub-1" {
  subnet_id      = aws_subnet.pri-sub-1.id
  route_table_id = aws_route_table.private-rt.id
}

  resource "aws_route_table_association" "associate-pri-sub-2" {
  subnet_id      = aws_subnet.pri-sub-2.id
  route_table_id = aws_route_table.private-rt.id
}