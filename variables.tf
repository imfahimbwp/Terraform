# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
 
variable "availability_zones" {
  description = "AWS availability zones in this region"
  type        = list(string)
  default     = ["us-east-1a","us-east-1b"]
}

# Variables for VPC
###################################### 
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}
 
variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = false
}
 
variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

# Variables for Subnet
######################################
 
variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}
 
variable "public_sbn_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.10.5.0/24","10.10.6.0/24"]
}

variable "subnettag" {
  type = list
  default = ["Public_Subnet01","Public_Subnet02"]
}

variable "private_sbn_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = list
  default     = ["10.10.3.0/24","10.10.4.0/24"]
} 

variable "subnettag1" {
  type = list
  default = ["Private_Subnet01","Private_Subnet02"]
}

# Variables for Route Table
######################################
 
variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}