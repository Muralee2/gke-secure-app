provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

terraform {
  required_providers {
    google     = { source = "hashicorp/google" }
    cloudflare = { source = "cloudflare/cloudflare" }
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
  source      = "./modules/gke"
  project_id  = var.project_id
  region      = var.region
  network     = module.vpc.network_name
  subnetwork  = module.vpc.subnetwork_name
}


provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "whereami" {
  name       = "whereami"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace  = "default"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hostname"
    value = var.domain_name
  }
}
