terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.22.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.1"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "pfe-gitops" # Organization should already exists in Terraform Cloud

    workspaces {
      name = "pfe-gitops-terraform-infra"
      # Two cases: 
      # Case-1: If workspace already exists, should not have any state files in states tab
      # Case-2: If workspace not exists, during migration it will get created
    }
  }
}

data "azuread_service_principal" "k8s-sp" {
  application_id = "49ed09ea-8b32-4342-945f-2de5746b2ad6"
}

# Provider Block
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = data.azuread_service_principal.k8s-sp.application_tenant_id
  client_id       = data.azuread_service_principal.k8s-sp.application_id
  client_secret   = var.client_secret
}

provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

# Export kubeconfig to local file for immediate kubectl connection
resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
  filename   = "~/.kube/config"
  content    = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config_raw
}