resource "aws_vpc" "MY_VPC01" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "MYVPC01"
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id            = aws_vpc.MY_VPC01.id
  cidr_block        = var.public_sbn_cidr_block1 #10.10.1.0
  availability_zone = var.aws_region_az2
  map_public_ip_on_launch = var.sbn_public_ip

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "Private_Subnet" {
  vpc_id            = aws_vpc.MY_VPC01.id
  cidr_block        = var.private_sbn_cidr_block1 #10.10.11.0
  availability_zone = var.aws_region_az1

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_security_group" "SG01" {
  name        = "MY SG01"
  description = "Allow Inbound/Outbount traffic"
  vpc_id      = aws_vpc.MY_VPC01.id

  ingress {
    description      = "Allow SSH Port 22"
    from_port        = var.sg_ingress_ssh
    to_port          = var.sg_ingress_ssh
    protocol         = var.sg_ingress_proto
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow HTTPS Port 443"
    from_port        = var.sg_ingress_HHTPS
    to_port          = var.sg_ingress_HHTPS
    protocol         = var.sg_ingress_proto
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow ICMP Traffic"
    from_port        = var.sg_ingress_Ping
    to_port          = var.sg_ingress_Ping
    protocol         = var.sg_ingress_proto_icmp
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    protocol         = var.sg_egress_proto
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MY SG01"
  }
}

resource "aws_internet_gateway" "IGW01" {
  vpc_id = aws_vpc.MY_VPC01.id

  tags = {
    Name = "IGW01"
  }
}

resource "aws_route_table" "RT01" {
  vpc_id = aws_vpc.MY_VPC01.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.IGW01.id
  }

  tags = {
    Name = "Public Router (To Internet)"
  }
}

resource "aws_route_table_association" "PublicSubnet" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.RT01.id
}