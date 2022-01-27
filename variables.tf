# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
 
variable "aws_region_az1" {
  description = "AWS region availability zone1"
  type        = string
  default     = "us-east-1a"
}

variable "aws_region_az2" {
  description = "AWS region availability zone2"
  type        = string
  default     = "us-east-1b"
}

variable "aws_region_az3" {
  description = "AWS region availability zone3"
  type        = string
  default     = "us-east-1c"
}

variable "aws_region_az4" {
  description = "AWS region availability zone3"
  type        = string
  default     = "us-east-1a"
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
# Variables for Security Group
######################################
 
variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}
 
variable "sg_ingress_ssh" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "22"
}

variable "sg_ingress_HHTPS" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "443"
}

variable "sg_ingress_proto_icmp" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "ICMP"
}

variable "sg_ingress_Ping" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "-1" #Allow All ICMP Traffic
}

variable "sg_ingress_cidr_block" {
  description = "CIDR block for the ingress rule"
  type        = string
  default     = "0.0.0.0/0"
}

variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}
 
variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}
 
variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}
# Variables for Subnet
######################################
 
variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}
 
variable "public_sbn_cidr_block1" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_sbn_cidr_block1" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.10.11.0/24"
} 
 
# Variables for Route Table
######################################
 
variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}
# Variables for Instance
######################################
 
variable "instance_ami" {
  description = "ID of the AMI Ubuntu Server 20.04 LTS (HVM), SSD Volume Type - (64-bit x86)"
  type        = string
  default     = "ami-04505e74c0741db8d"
}
 
variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro" #Free tier eligible
}
 
variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "ca-key"
}