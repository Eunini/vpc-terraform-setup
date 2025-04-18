# 🚀 Terraform AWS VPC Project - KCVPC

This project uses Terraform to provision and manage a Virtual Private Cloud (VPC) on AWS in the **EU-West-1 (Ireland)** region. It includes a public and a private subnet, EC2 instances, NAT Gateway, route tables, and user data for Nginx and PostgreSQL.

---

## 📌 Objective

- Provision a complete AWS network environment with Terraform.
- Launch a public EC2 instance with **Nginx**.
- Launch a private EC2 instance with **PostgreSQL**.
- Use NAT and Internet Gateway to manage outbound/inbound internet access.
- Implement secure access using Security Groups and NACLs.

---

## 🏗️ Infrastructure Overview

| Component            | Description                                |
|----------------------|--------------------------------------------|
| VPC                  | `KCVPC` with CIDR `10.0.0.0/16`             |
| Public Subnet        | `10.0.1.0/24` in `eu-west-1a`              |
| Private Subnet       | `10.0.2.0/24` in `eu-west-1a`              |
| IGW                  | Internet Gateway for public subnet         |
| NAT Gateway          | Allows private subnet to access the internet |
| EC2 (Public)         | Ubuntu + Nginx                             |
| EC2 (Private)        | Ubuntu + PostgreSQL                        |

---

## 🔐 Security Groups

### Public EC2 SG:
- **Inbound:**
  - TCP 22 (SSH) from your IP
  - TCP 80 (HTTP) from `0.0.0.0/0`
  - TCP 443 (HTTPS) from `0.0.0.0/0`
- **Outbound:** All
 public security group image screenshot
![public sg](https://github.com/user-attachments/assets/db3884db-ca3b-430f-835a-4388b8e530fa)
  

### Private EC2 SG:
- **Inbound:** PostgreSQL (5432) from Public EC2
- **Outbound:** All
private securiy group image screenshot
![private sg](https://github.com/user-attachments/assets/a46d62f2-3990-4914-a5a5-19818e7881d0)

---

## 🛡️ Network ACLs (NACLs)

### Public Subnet NACL
- Allow inbound HTTP, HTTPS, and SSH
- Allow all outbound

![public nacl](https://github.com/user-attachments/assets/4ee390ff-584f-43ca-bbc1-3a8fd902e631)


### Private Subnet NACL
- Allow inbound from public subnet
- Allow outbound to NAT Gateway
![private nacl](https://github.com/user-attachments/assets/3e17a6ad-19c3-4993-9bb5-c4edd8845059)

---

## ⚙️ User Data Scripts

### `user_data/nginx.sh`
```bash
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
```

### `user_data/postgres.sh`
```bash
#!/bin/bash
sudo apt update -y
sudo apt install postgresql postgresql-contrib -y
sudo systemctl enable postgresql
sudo systemctl start postgresql
```

---

## 📂 Project File Structure

```
vpc-terraform-setup/
│
├── main.tf                # Terraform resources
├── variables.tf           # Input variables
├── outputs.tf             # Outputs
├── terraform.tfvars       # Variable values
├── user_data/
│   ├── nginx.sh
│   └── postgres.sh
├── tfplan.txt             # Output of terraform plan
├── screenshots/           # Evidence screenshots
└── README.md              # This documentation
```

---

## ssh into private instance
![ssh prvae 1](https://github.com/user-attachments/assets/2567819b-77dc-4b88-96a2-a7c8b74d8c5f)
![ssh private](https://github.com/user-attachments/assets/1b329eaa-5f66-4eb9-a259-aadcb40879e7)


## 🧪 Usage Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Eunini/vpc-terraform-setup.git
cd vpc-terraform-setup
```

### 2. Initialize Terraform
```bash
terraform init
```
![new terraform init](https://github.com/user-attachments/assets/dbdb9b5f-969a-4d6f-8640-f95afdc31238)

### 3. Plan the Infrastructure
```bash
terraform plan -out=tfplan.txt
```
![terraform plan](https://github.com/user-attachments/assets/b4e4569b-afc9-4421-80f5-d8078200c9d2)

### 4. Apply the Infrastructure
```bash
terraform apply tfplan.txt
```
![terraform apply](https://github.com/user-attachments/assets/e3f25985-a021-4bed-8f7f-aebcb798f499)

### 5. Destroy the Infrastructure
```bash
terraform destroy
```

---

## 📋 Prerequisites

- ✅ [Terraform](https://developer.hashicorp.com/terraform/downloads)
- ✅ [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) configured
- ✅ An AWS IAM user with access keys and sufficient permissions
- ✅ SSH key pair for EC2 access

---

## 🌐 Terraform Provider Configuration

```hcl
provider "aws" {
  region = "eu-west-1"
}
```

---

## ✍️ Author

**Inioluwa Atanda**  
Email: atandainioluwa371@gmail.com
