# scalable-devops-pipeline-aws-k8s

## Overview
This project implements an end-to-end DevOps workflow for deploying a scalable, secure, and automated cloud-based web application using AWS, Terraform, Kubernetes, GitHub Actions, Docker, and monitoring tools like Prometheus and Grafana.

The goal is to design, deploy, and manage a production-ready infrastructure with high availability, security, and automation.

## Current Progress
- Infrastructure Setup (Terraform Modules, AWS Services, VPC, EKS, RDS, ALB, IAM)
- Remote Terraform State Management (S3 and DynamoDB)
- CloudWatch for Logs and Monitoring
- Security Best Practices (IAM Roles, Secrets Manager, Encrypted Storage)
- Containerized Application (Docker, docker-compose, ECR)
- Kubernetes Manifests (Deployments, StatefulSet, Services, Ingress, HPA)
- CI/CD Pipelines (GitHub Actions: ECR build/push and EKS deploy)
- Prometheus and Grafana Monitoring Stack on Kubernetes
- Logging Pipeline (Fluent Bit to CloudWatch and Loki, Grafana log querying)
- Security Enhancements (KMS customer-managed keys, WAF WebACL, IAM worker role and password policy)

## Tech Stack
| Category | Tools Used |
|---|---|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| Version Control | Git, GitHub |
| Configuration Management | Ansible |
| Containerization | Docker |
| Orchestration | Kubernetes (EKS) |
| CI/CD Pipeline | GitHub Actions |
| Monitoring and Logging | Prometheus, Grafana, CloudWatch, Loki |
| Database | AWS RDS (PostgreSQL) |
| Caching | AWS ElastiCache (Redis) |
| Security and Compliance | IAM, AWS Secrets Manager, KMS, Security Groups, WAF |

## Terraform Folder Structure
terraform-project/

├── modules/

│   ├── vpc/          # Networking (VPC, Subnets, NAT Gateway)

│   ├── eks/          # Kubernetes Cluster (EKS)

│   ├── rds/          # Database (PostgreSQL)

│   ├── iam/          # IAM Roles and Policies

│   ├── s3/           # Storage (S3 for Logs and Terraform State)

│   ├── alb/          # Load Balancer (ALB)

│   ├── cloudwatch/   # Monitoring and Logging

│   ├── elasticache/  # Caching (Redis)

│   └── efs/          # Shared Storage (EFS)

├── main.tf           # Calls all modules

├── provider.tf       # AWS provider setup

├── terraform.tfvars  # Variable values

├── variables.tf      # Global variables

├── outputs.tf        # Global output values

└── backend.tf        # S3 Backend Configuration

Terraform state is managed securely in AWS S3 and locked via DynamoDB.

## Deployment Steps

### 1. Deploy AWS Infrastructure
```bash
terraform init
terraform plan
terraform apply -auto-approve
```

### 2. Set GitHub Actions Secrets
| Secret | Description |
|---|---|
| AWS_ACCESS_KEY_ID | IAM user access key |
| AWS_SECRET_ACCESS_KEY | IAM user secret key |
| AWS_REGION | e.g. eu-west-1 |
| ECR_REGISTRY | e.g. 123456789.dkr.ecr.eu-west-1.amazonaws.com |
| EKS_CLUSTER_NAME | Your EKS cluster name |

### 3. Deploy Kubernetes Application
CI/CD is fully automated via GitHub Actions:

- **build-push-ecr.yml** — triggers on app changes to main, builds Docker images and pushes to ECR
- **deploy-eks.yml** — triggers after ECR workflow succeeds, deploys manifests to EKS
- **deploy-monitoring.yml** — triggers on monitoring config changes, deploys Prometheus and Grafana

To deploy manually:
```bash
# Configure kubectl
aws eks update-kubeconfig --region <region> --name <cluster-name>

# Deploy application
kubectl apply -f k8s/

# Deploy monitoring
kubectl apply -f k8s/monitoring/
```

## Connect
- GitHub: https://github.com/Unnavasriteja
- LinkedIn: https://www.linkedin.com/in/sstunnava
