resource "aws_vpc" "MY_VPC01" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "MYVPC01"
  }
}

resource "aws_subnet" "Public_Subnet" {
  count = "${length(var.public_sbn_cidr_block)}"
  vpc_id = aws_vpc.MY_VPC01.id
  cidr_block = "${var.public_sbn_cidr_block[count.index]}" #10.10.5.0 10.10.6.0
  availability_zone = "${var.availability_zones[count.index]}"
  map_public_ip_on_launch = true
  
  tags = {
    Name = var.subnettag[count.index]
  }
}

resource "aws_subnet" "Private_Subnet" {
  count = "${length(var.private_sbn_cidr_block)}"
  vpc_id            = aws_vpc.MY_VPC01.id
  cidr_block        = "${var.private_sbn_cidr_block[count.index]}" #10.10.3.0 10.10.4.0
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = var.subnettag1[count.index]
  }
}
/*
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
}*/