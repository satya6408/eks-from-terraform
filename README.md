# eks-from-terraform
# 🚀 AWS EKS Cluster Deployment Using Terraform

\<p align="center">   \<b>Infrastructure as Code | AWS | Terraform | Kubernetes | Amazon EKS\</b> \</p>

\<p align="center">   \<img src="[https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform)" />   \<img src="[https://img.shields.io/badge/AWS-EKS-FF9900?logo=amazonaws](https://img.shields.io/badge/AWS-EKS-FF9900?logo=amazonaws)" />   \<img src="[https://img.shields.io/badge/Kubernetes-Container%20Orchestration-326CE5?logo=kubernetes](https://img.shields.io/badge/Kubernetes-Container%20Orchestration-326CE5?logo=kubernetes)" /> \</p>

---

## 📌 Project Overview

This project demonstrates how to create and manage an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform.

The infrastructure is provisioned using reusable Terraform modules and AWS services.

**Main objective:** Automate Kubernetes cluster deployment on AWS using Infrastructure as Code (IaC).

## 🏗️ Architecture

```text
                 AWS Cloud
                     |
                  VPC
                     |
          +----------+----------+
          |                     |
     Public Subnets       Private Subnets
          |                     |
     Internet Gateway       Amazon EKS
                                |
                       EKS Managed Node Group
                                |
                         EC2 Worker Nodes
                                |
                         Kubernetes Pods
```

## 🛠️ Technologies Used

| Technology | Purpose                   |
| ---------- | ------------------------- |
| AWS        | Cloud infrastructure      |
| Terraform  | Infrastructure automation |
| Amazon EKS | Managed Kubernetes        |
| VPC        | Network isolation         |
| EC2        | Worker nodes              |
| IAM        | Access management         |
| Kubernetes | Container orchestration   |

## 📂 Project Structure

```text
terraform-eks/
│
├── provider.tf       # AWS provider configuration
├── terraform.tf      # Terraform configuration
├── locals.tf         # Local variables
├── vpc.tf            # VPC and networking
├── eks.tf            # EKS cluster and node groups
├── .gitignore        # Ignore sensitive files
├── .terraform.lock.hcl
└── README.md         # Project documentation
```

## ⚙️ AWS Infrastructure

### 1. VPC Configuration

- Creates a dedicated AWS VPC.
- Configures public, private and internal subnets.
- Provides networking for EKS.

### 2. EKS Cluster

- Uses Terraform AWS EKS module.
- Kubernetes version: 1.33
- Enables public API endpoint access.
- Configures EKS cluster addons:
  - VPC CNI
  - CoreDNS
  - kube-proxy

### 3. Managed Node Groups

- Uses Amazon Linux 2023.
- Instance type: `m7i-flex.large`
- Capacity type: Spot
- Minimum nodes: 2
- Desired nodes: 2
- Maximum nodes: 3

## 🚀 Deployment Steps

### Step 1: Clone Repository

```bash
git clone https://github.com/satya6408/eks-from-terraform.git
cd eks-from-terraform
```

### Step 2: Initialize Terraform

```bash
terraform init
```

### Step 3: Validate Configuration

```bash
terraform fmt
terraform validate
```

### Step 4: Review Infrastructure Plan

```bash
terraform plan
```

### Step 5: Deploy Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

### Step 6: Verify EKS Cluster

Configure kubectl using AWS CLI:

```bash
aws eks update-kubeconfig \
  --region ap-southeast-1 \
  --name YOUR_CLUSTER_NAME
```

Check cluster nodes:

```bash
kubectl get nodes
```

Check running pods:

```bash
kubectl get pods -A
```

## 🧹 Cleanup

To delete the AWS infrastructure created by Terraform:

```bash
terraform destroy
```

Review the resources before confirming.

## 🔐 Security Notes

- Never upload AWS access keys or secret keys.
- Never commit Terraform state files.
- Keep sensitive variables out of GitHub.
- Restrict SSH and Kubernetes API access.
- Use IAM roles and least-privilege permissions.

## 💰 AWS Cost Warning

Amazon EKS and EC2 worker nodes can incur charges.

The configured `m7i-flex.large` Spot instances are not generally covered by the AWS Free Tier.

Destroy unused infrastructure to avoid unnecessary costs.

---

GitHub: [@satya6408](https://github.com/satya6408)

Project: [eks-from-terraform](https://github.com/satya6408/eks-from-terraform)

---

⭐ If you find this project useful, consider giving the repository a star!
