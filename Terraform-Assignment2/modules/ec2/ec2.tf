resource "aws_instance" "web_server_cloudinit"{
    ami              = var.instance_ami
    instance_type    = var.instance_type 
    vpc_security_group_ids = [aws_security_group.webserver_sg.id]
    
   user_data = file("cloud-init-yml.sh")
    tags = {
        Name = "Web Server Instance"
    }
} 

resource "aws_security_group" "webserver_sg" {
  name        = "Webserver_sg" # Name of the security group
  description = "Security group for web server that runs via cloud-init" # Description of the security group
  #vpc_id      = var.vpc_id 

tags = {
    Name = "Webserver_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "HTTPS" {
  security_group_id = aws_security_group.webserver_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

# #Don't Uncomment
# # resource "aws_vpc_security_group_egress_rule" "HTTPS" {
# #     security_group_id = aws_security_group.webserver_sg.id

# #   cidr_ipv4   = "0.0.0.0/0"
# #   from_port   = 443
# #   ip_protocol = "tcp"
# #   to_port     = 443
# # }

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
   security_group_id = aws_security_group.webserver_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

# #Don't Uncomment
# # resource "aws_vpc_security_group_egress_rule" "HTTP" {
# #     security_group_id = aws_security_group.webserver_sg.id

# #   cidr_ipv4   = "0.0.0.0/0"
# #   from_port   = 80
# #   ip_protocol = "tcp"
# #   to_port     = 80
# # }


resource "aws_vpc_security_group_ingress_rule" "SSH" {
   security_group_id = aws_security_group.webserver_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

# #Don't Uncomment
# # resource "aws_vpc_security_group_egress_rule" "SSH" {
# #     security_group_id = aws_security_group.webserver_sg.id

# #   cidr_ipv4   = "0.0.0.0/0"
# #   from_port   = 22
# #   ip_protocol = "tcp"
# #   to_port     = 22
# # }




resource "aws_vpc_security_group_egress_rule" "All" {
    security_group_id = aws_security_group.webserver_sg.id
    
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}

