variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone for subnets"
  default     = "eu-north-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of your EC2 key pair"
  default     = "my-key" 
}

variable "my_ip" {
  description = "Your public IP address for SSH access"
  default     = "172.166.151.116/32" 
}

variable "db_password" {
  description = "Password for PostgreSQL database"
  default     = "Inioluwa16#" 
  sensitive   = true
}