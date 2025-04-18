#!/bin/bash

# Update package lists
apt-get update -y

# Install Nginx
apt-get install -y nginx

# Start Nginx service
systemctl start nginx

# Enable Nginx to start on boot
systemctl enable nginx

# Create a simple index.html
echo "<html><body><h1>Welcome to Nginx on Public Instance</h1></body></html>" > /var/www/html/index.html

# Restart Nginx to apply changes
systemctl restart nginx