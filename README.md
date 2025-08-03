# 🔐 Secure GKE Microservice Deployment with Terraform, Helm, and Cloudflare

## ✅ Project Overview

This project deploys a secure, private Google Kubernetes Engine (GKE) cluster using Terraform and Helm, with:

- Custom VPC
- Private GKE cluster (no public IP)
- Secure microservice using Helm chart (e.g., whereami)
- Ingress with HTTPS (via cert-manager & Let's Encrypt)
- DNS via Cloudflare
- Unit tests using Terratest
- External Python script to generate dynamic firewall rules

---

## 🌐 Stack Used

- Google Cloud Platform (GKE, VPC, IAM, Firewall)
- Terraform
- Helm
- Cloudflare DNS
- cert-manager for HTTPS
- Python (for dynamic firewall rules)
- Terratest (Go)

---

## 📁 Folder Structure

