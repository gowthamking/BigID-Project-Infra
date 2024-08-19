output "cus_vpc_id" {
  value = aws_vpc.wiki-vpc.id
}

output "cus_vpc_id_def_rt" {
  value = aws_vpc.wiki-vpc.default_route_table_id
}