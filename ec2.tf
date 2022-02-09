#resource "aws_key_pair" "Ubuntukey" {
  #key_name   = "Ubuntu-key"
  #public_key = var.Ubuntu_key
#}
/*
resource "aws_instance" "WebSRV01" {
    ami = var.instance_ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.SG01.id] 
    subnet_id = aws_subnet.Public_Subnet.id
    key_name = "ubuntu_pem_key"
    tags = {
      "Name" = "Ubuntu Web Server01"
    }
}*/
/*
resource "aws_instance" "DBSRV" {
    ami = var.instance_ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.SG01.id]
    subnet_id = aws_subnet.Private_Subnet.id
    key_name = "ubuntu_pem_key"
    tags = {
      "Name" = "Ubuntu Database Server01"
    }
}*/