[README.pdf](https://github.com/user-attachments/files/21073809/README.pdf)

# 🚀 AWS Static Website Deployment using Terraform & Nginx

This project demonstrates deploying a static HTML website on AWS using **Terraform** and **Nginx**. The infrastructure includes a custom VPC, public/private subnets, and an EC2 instance running Nginx. Terraform uses **S3 + DynamoDB** for remote backend and state locking.

---

## 🧱 What’s Included

- 🏗️ Terraform for full infrastructure automation
- 🌐 Custom VPC with public/private subnets
- 🛡️ Internet Gateway, NAT Gateway, and route tables
- 🖥️ EC2 instance hosting Nginx
- 💾 S3 bucket for Terraform remote state
- 🔒 DynamoDB table for state locking

---

## 📂 Folder Structure

nginx_website_using-terraform/
├── main.tf
├── backend.tf
├── provider.tf
├── files/
   └── index.html
   
<img width="483" alt="Screenshot 2025-07-05 at 1 15 18 PM" src="https://github.com/user-attachments/assets/384f0cf0-d009-4045-a630-2a58667908a0" />

---

## What is a Terraform Backend?
A backend is where Terraform stores its state file. It is responsible for:
Keeping track of resources Terraform creates
Allowing multiple people to work on the same infrastructure
Managing state file locking to avoid corruption

<img width="438" alt="Screenshot 2025-07-05 at 1 19 47 PM" src="https://github.com/user-attachments/assets/a26da00a-c39c-449e-8de8-21d466e81eb4" />

---

## 🔁 Backend Configuration (terraform block)

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-prince"
    key            = "ec2/nginx-instance.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table-prince"
  }
}
⚠️ These resources must be created first via a bootstrap script, as Terraform needs them before init.

---

## 🏗️ Main Infrastructure Deployment

### Once the backend exists:
- Add the backend block in a new project
- Run terraform init to migrate state
- Add VPC, subnet, EC2, security groups, and Nginx provisioning

### EC2 Setup + Nginx
- sudo dnf update -y
- sudo dnf install nginx -y
- sudo systemctl start nginx
- sudo systemctl enable nginx
- Deploy HTML and Access in browser: http:<//EC2-PUBLIC-IP>

---

## FINAL OUTPUT: 

<img width="1440" alt="Screenshot 2025-07-05 at 1 26 27 PM" src="https://github.com/user-attachments/assets/b7c88a29-9044-4502-bb61-ef9bd75e7916" />


