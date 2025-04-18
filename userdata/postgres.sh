#!/bin/bash

# Update package lists
apt-get update -y

# Install PostgreSQL
apt-get install -y postgresql postgresql-contrib

# Start PostgreSQL service
systemctl start postgresql

# Enable PostgreSQL to start on boot
systemctl enable postgresql

# Change postgres user password and create a database
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '${db_password}';"
sudo -u postgres psql -c "CREATE DATABASE kcdatabase;"

# Configure PostgreSQL to accept connections from public subnet
echo "host all all 10.0.1.0/24 md5" >> /etc/postgresql/12/main/pg_hba.conf
echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf

# Restart PostgreSQL to apply changes
systemctl restart postgresql