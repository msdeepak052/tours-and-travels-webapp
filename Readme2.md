# Tours & Travels WebApp - End-to-End DevOps Implementation

**Author:** Deepak  
**GitHub Repository:** [https://github.com/msdeepak052/tours-and-travels-webapp.git](https://github.com/msdeepak052/tours-and-travels-webapp.git)

---

## Table of Contents

1. [Introduction](#introduction)
2. [Part 1: Infrastructure as Code (IaC) with Terraform](#part-1-infrastructure-as-code-terraform)
    - VPC Setup
    - EKS Cluster Creation
    - ECR for Docker Image Storage
    - EC2 Instances (Jenkins, SonarQube, Nexus)
3. [Part 2: CI/CD Pipeline Implementation](#part-2-cicd-pipeline-implementation)
    - CI Pipeline (Maven Build, SonarQube, Nexus, Trivy, ECR Push)
    - CD Pipeline (ArgoCD, Kubernetes Deployment)
4. [Part 3: Monitoring & Enhancements](#part-3-monitoring--enhancements)
    - Prometheus & Grafana for Monitoring
    - Jenkins Email Notifications
    - Route 53 & Ingress for DNS Routing
5. [Conclusion & Learnings](#conclusion--learnings)

---

## 1. Introduction

This project demonstrates a complete DevOps implementation for a Tours & Travels Web Application using:

- ✔ **Terraform** (Infrastructure as Code)
- ✔ **AWS EKS** (Kubernetes)
- ✔ **Jenkins CI/CD Pipeline**
- ✔ **SonarQube, Trivy, OWASP** for Security
- ✔ **ArgoCD** for GitOps Deployment
- ✔ **Prometheus & Grafana** for Monitoring

The goal was to automate deployments, ensure security, and monitor the application efficiently.

---

## 2. Part 1: Infrastructure as Code (Terraform)

**Key Components Deployed:**

- ✅ **VPC** – Isolated network for secure deployments.
- ✅ **EKS Cluster** – Managed Kubernetes for container orchestration.
- ✅ **ECR** – Private Docker registry for storing application images.
- ✅ **EC2 Instances:**
    - Jenkins Server (with Docker, kubectl, AWS CLI, Trivy, ArgoCD CLI, Maven)
    - SonarQube Server – Static code analysis for quality checks.
    - Nexus Repository – Artifact storage for Java (Maven) builds.

**Terraform Approach:**

- ✔ **Modular Structure** – Separate modules for VPC, EKS, ECR, EC2.
- ✔ **Dynamic Variables** – Minimal hardcoding, using tfvars.
- ✔ **Outputs** – Reusable outputs for other modules.

**Example:**
```hcl
module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
}
```
