provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
}

module "firewall" {
  source     = "./modules/firewall"
  project_id = var.project_id
  network    = module.vpc.network_name
}

module "gke" {
  source              = "./modules/gke"
  cluster_name        = "secure-cluster"
  region              = "us-central1"
  gke_service_account = "terraform-deployer2@modern-girder-463514-t1.iam.gserviceaccount.com"
}


resource "helm_release" "whereami" {
  name       = "whereami"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace  = "default"

  set = [
    {
      name  = "service.type"
      value = "ClusterIP"
    },
    {
      name  = "ingress.enabled"
      value = "true"
    },
    {
      name  = "ingress.hostname"
      value = var.domain_name
    }
  ]
}

