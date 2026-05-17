resource "aws_instance" "web_server_cloudinit"{
    ami              = var.instance_ami
    instance_type    = var.instance_type 
    vpc_security_group_ids = [aws_security_group.webserver_sg.id]
    
   # user_data = file("userdata.sh")
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
