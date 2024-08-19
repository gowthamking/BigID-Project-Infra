provider "aws" {
  region = "ap-south-1"
}

module "custom_vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

# module "public-subnet-1-with-IGW"{
#   source = "./modules/public-subnet-1-and-2-with-IGW"
#   vpc_id = module.custom_vpc.cus_vpc_id
#   pub-subnet1_cidr = var.pub-subnet1_cidr
#   # pub-subnet2_cidr = var.pub-subnet2_cidr
#   pub-subnet_1_az = var.pub-subnet_1_az
#   # pub-subnet_2_az = var.pub-subnet_2_az
#   vpc_rt_id = module.custom_vpc.cus_vpc_id_def_rt
#   igw_route = var.igw_route
# }

module "Public-subnet" {
  source = "./modules/public-subnet-1-and-2-with-IGW"
  vpc_id = module.custom_vpc.cus_vpc_id
  pub-subnet1_cidr = var.pub-subnet1_cidr
  pub-subnet2_cidr = var.pub-subnet2_cidr
  pub-subnet_1_az = var.pub-subnet_1_az
  pub-subnet_2_az = var.pub-subnet_2_az
  vpc_rt_id = module.custom_vpc.cus_vpc_id_def_rt
  igw_route = var.igw_route
  

}

module "security-groups" {
  source = "./modules/security-groups"
  vpc_id = module.custom_vpc.cus_vpc_id
  ssh-sg = var.ssh-sg
}

module "EC2_instance" {
  source = "./modules/EC2-Instance"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_file = var.key_file
  pub_sub-1 = module.Public-subnet.pub_subnet_id
  
  sg_id = [module.security-groups.sg_id]
  for_each = var.server_names

  server_name = each.value

}

module "sgs" {
  source = "./modules/sg_eks"
  vpc_id = module.custom_vpc.cus_vpc_id
}

module "eks" {
  source = "./modules/eks"
  vpc_id = module.custom_vpc.cus_vpc_id
  subnet_ids = [module.Public-subnet.pub_subnet_id,module.Public-subnet.pub_subnet_id_2]
  sg_ids = module.sgs.security_group_public
  
}