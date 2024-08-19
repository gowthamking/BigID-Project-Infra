variable "vpc_cidr" {
  description = "CIDR or network id for VPC"
}

variable "pub-subnet1_cidr" {
  description = "CIDR for subnet-1"
}

variable "pub-subnet2_cidr" {
  description = "CIDR for subnet-2"
}


variable "pub-subnet_1_az" {
  description = "CIDR for subnet-1"
}

variable "pub-subnet_2_az" {
  description = "CIDR for subnet-2"
}

variable "igw_route" {}

# variable "pri-subnet1_cidr" {}
# variable "pri-subnet_1_az" {}
# variable "pri-subnet2_cidr" {}
# variable "pri-subnet_2_az" {}
variable "ssh-sg" {}

variable "ami_id" {}
variable "instance_type" {}
variable "key_file" {}

# variable "sg_id" {
#   description = "A list of security group IDs"
#   type        = list(string)
# }


variable "server_names" {
  default = {
    jenkins = "jenkins-server"
    ansible = "ansible-server"
    maven   = "jenkins-slave-server"
  }
}