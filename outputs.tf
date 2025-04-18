output "vpc_id" {
  value = aws_vpc.kcvpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_instance_public_ip" {
    value = aws_instance.public_instance.public_ip
}

output "private_instance_private_ip" {
  value = aws_instance.private_instance.private_ip
}

output "nginx_url" {
  value = "http://${aws_instance.public_instance.public_ip}"
}