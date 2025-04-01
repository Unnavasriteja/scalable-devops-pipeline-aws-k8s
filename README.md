# scalable-devops-pipeline-aws-k8s

## Overview  
This project implements an end-to-end DevOps workflow for deploying a scalable, secure, and automated cloud-based web application using AWS, Terraform, Kubernetes, Jenkins, Docker, and monitoring tools like Prometheus & Grafana.

The goal is to design, deploy, and manage a production-ready infrastructure with high availability, security, and automation.

---

## Current Progress

✔️ Infrastructure Setup (Terraform Modules, AWS Services, VPC, EKS, RDS, ALB, IAM)  
✔️ Remote Terraform State Management (S3 & DynamoDB)  
✔️ CloudWatch for Logs & Monitoring  
✔️ Security Best Practices (IAM Roles, Secrets Manager, Encrypted Storage)  

---

## Roadmap (WIP)

| Task | Status |
|------|--------|
| Infrastructure Setup (VPC, EKS, RDS, IAM, Security) | ✅ Completed |
| Terraform State Management (S3 & DynamoDB) | ✅ Completed |
| CloudWatch Logs & Monitoring for AWS Services | ✅ Completed |
| Security Hardening (IAM, Secrets Manager, Network Isolation) | ✅ Completed |
| Containerizing the Web Application (MERN Stack) | ⏳ In Progress |
| Creating Kubernetes Deployment Manifests (YAMLs, Helm) | ⏳ In Progress |
| Deploying the App to Kubernetes (EKS) | ⏳ In Progress |
| Implementing CI/CD Pipeline (Jenkins, GitHub Actions) | ⏳ Not Started |
| Integrating Prometheus & Grafana for Monitoring | ⏳ Not Started |
| Logging with Fluentd, Loki, and CloudWatch | ⏳ Not Started |
| Enabling Kubernetes Autoscaling (HPA, Cluster Autoscaler) | ⏳ Not Started |
| Security Enhancements (AWS KMS, IAM Refinements, AWS WAF) | ⏳ Not Started |
| Load Testing & Performance Optimization | ⏳ Not Started |

---

## Tech Stack

| Category | Tools Used |
|---------|-------------|
| Cloud Provider | AWS |
| Infrastructure as Code (IaC) | Terraform |
| Version Control | Git, GitHub |
| Configuration Management | Ansible |
| Containerization | Docker |
| Orchestration | Kubernetes (EKS) |
| CI/CD Pipeline | Jenkins, GitHub Actions |
| Monitoring & Logging | Prometheus, Grafana, CloudWatch |
| Database | AWS RDS (PostgreSQL) |
| Caching | AWS Elasticache (Redis) |
| Security & Compliance | IAM, AWS Secrets Manager, Security Groups |

---

## Terraform Folder Structure

```
terraform-project
 ┣ modules
 ┃ ┣ vpc            # Networking (VPC, Subnets, NAT Gateway, Flow Logs)
 ┃ ┣ eks            # Kubernetes Cluster (EKS)
 ┃ ┣ rds            # Database (PostgreSQL)
 ┃ ┣ iam            # IAM Roles & Policies
 ┃ ┣ s3             # Storage (S3 for Logs & Terraform State)
 ┃ ┣ alb            # Load Balancer (ALB)
 ┃ ┣ cloudwatch     # Monitoring & Logging
 ┃ ┣ elasticache    # Caching (Redis)
 ┃ ┣ efs            # Shared Storage (EFS)
 ┣ main.tf          # Calls all modules
 ┣ provider.tf      # AWS provider setup
 ┣ terraform.tfvars # Variable values
 ┣ variables.tf     # Global variables
 ┣ outputs.tf       # Global output values
 ┣ backend.tf       # S3 Backend Configuration
```

Terraform state is managed securely in AWS S3 & locked via DynamoDB!

---

## Deployment Steps

### 1. Deploy AWS Infrastructure

Run the following Terraform commands to provision AWS resources:

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

This will provision all AWS infrastructure components automatically.

---

### 2. Deploy Kubernetes Application (Upcoming)

Once the infrastructure is ready:

- Containerize the web application using Docker  
- Deploy it to EKS using Kubernetes manifests  
- Automate deployments using GitHub Actions & Jenkins  

---

## Applying This Infrastructure to Validator Operations (PoC Goals)

As I continue developing this project, my next focus is exploring how this Terraform- and Kubernetes-based pipeline can be adapted for blockchain infrastructure use cases — particularly validator node deployments and uptime automation.

### Planned Extensions:
- Deploying validator nodes (e.g., Cosmos SDK, Ethereum) to testnets using Terraform  
- Automating chain upgrades and validator restarts using container orchestration  
- Monitoring validator metrics (missed blocks, peer count, slashing risk) using Prometheus and Grafana  
- Implementing observability pipelines for blockchain-specific logs and alerts  
- Securing validator key material via Vault or AWS Secrets Manager  
- Adding failover + auto-recovery for high-availability validator setups  

---

## Conclusion

This end-to-end DevOps project lays the foundation for a secure, automated, and scalable infrastructure. While it's currently focused on traditional cloud web applications, the structure is evolving to support blockchain validator infrastructure and decentralized system reliability.

---

## Connect With Me

- Portfolio: https://sstunnava.com  
- GitHub: https://github.com/Unnavasriteja  
- LinkedIn: https://www.linkedin.com/in/sstunnava  

Stay tuned for updates as this grows into a validator-ready infrastructure!
