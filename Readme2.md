# Tours & Travels WebApp - End-to-End DevOps Implementation

**Author:** Deepak Yadav 

**GitHub Repository:** [https://github.com/msdeepak052/tours-and-travels-webapp.git](https://github.com/msdeepak052/tours-and-travels-webapp.git)

## Flowchart

![Tours-Travels-Webapp-Flowchart](https://github.com/user-attachments/assets/3e38a396-32b9-4e75-8845-fb97ce53135d)


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

## 3. Part 2: CI/CD Pipeline (Jenkins + ArgoCD)

### CI Pipeline Steps

1. **Git Checkout** – Pull latest code from GitHub.
2. **OWASP Dependency Check** – Security vulnerability scan.
3. **Maven Build** – Compile Java application.
4. **SonarQube Scan** – Code quality & security analysis.
5. **Nexus Upload** – Store the `.jar` artifact.
6. **Docker Build** – Create a containerized image.
7. **Trivy Scan** – Security scan for Docker image.
8. **Push to ECR** – Store the image in AWS ECR.
9. **Trigger CD Pipeline** – Notify ArgoCD for deployment.

---

### CD Pipeline (GitOps with ArgoCD)

- **Git Checkout (Manifests Repo):** Updates Kubernetes YAML files.
- **ArgoCD Sync:** Automatically applies changes to EKS.
- **Deploy to Kubernetes:** Pods, Services, Ingress are deployed.

---

#### Why ArgoCD?

- **Declarative GitOps:** Manifests stored in Git.
- **Auto-Sync:** Detects changes and applies them.
- **Rollback Capability:** Reverts to previous stable versions.

---

### Screenshots

![image57](https://github.com/user-attachments/assets/ca099378-6104-4db5-bc51-bd490b7fa106)

![image53](https://github.com/user-attachments/assets/6612aa6a-b725-420c-b3ca-8870068314da)


![image54](https://github.com/user-attachments/assets/a82d928e-cc00-4073-93fc-b040ce7599d4)


![image55](https://github.com/user-attachments/assets/82920db9-073a-4744-9610-424358123541)


![image56](https://github.com/user-attachments/assets/18640a0b-6b84-4eb2-b997-43632d7615f2)



![image51](https://github.com/user-attachments/assets/7ec20d40-a5c2-4ae1-a715-d1548460de59)


![image52](https://github.com/user-attachments/assets/5d0265e7-493f-49f3-862f-69d5ec85fa36)


![image45](https://github.com/user-attachments/assets/5e7bcecb-7e04-458c-a46b-ad2987a4f3b8)



## 4. Part 3: Monitoring & Enhancements

### a. Prometheus & Grafana

- **Prometheus:** Collects metrics from Kubernetes.
- **Grafana:** Visualizes metrics (CPU, Memory, HTTP Requests).
- **Alerts:** Set up for pod failures or high latency.

### b. Jenkins Email Notifications

- **Success/Failure Alerts:** Sent via SMTP (Gmail/Amazon SES).
- **Pipeline Status:** Immediate feedback on build results.

### c. Route 53 + Ingress for DNS

- **Route 53:** Domain management (e.g., tours-travels.example.com).
- **Ingress Controller (NGINX):** Routes traffic to Kubernetes services.

---

## 5. Conclusion & Learnings

### Key Takeaways

- ✔ **Infrastructure Automation:** Terraform made AWS setup repeatable.
- ✔ **Security Integration:** OWASP, Trivy, SonarQube improved code safety.
- ✔ **GitOps with ArgoCD:** Simplified Kubernetes deployments.
- ✔ **Monitoring:** Proactive issue detection with Prometheus/Grafana.

### Future Improvements

- **Auto-Scaling:** Based on traffic using KEDA.
- **Chaos Engineering:** Test resilience with Chaos Mesh.
- **Multi-Region Deployment:** For high availability.

---

## GitHub Repository

🔗 [https://github.com/msdeepak052/tours-and-travels-webapp.git](https://github.com/msdeepak052/tours-and-travels-webapp.git)

---

This documentation highlights the end-to-end DevOps implementation, showcasing infrastructure automation, CI/CD security, GitOps, and monitoring.

🚀 **Happy DevOps Journey!** 🚀
