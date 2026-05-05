output "instance_id" {
    description = "EC2 Instance ID"
    value       = aws_instance.web_server_wordpress.id 
}

output "public_ip" {
    description = "Public IP"
    value       = aws_instance.web_server_wordpress.public_ip
}