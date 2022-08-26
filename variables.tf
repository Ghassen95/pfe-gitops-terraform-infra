# Azure subscription ID
variable "subscription_id" {
  type        = string
  description = "Azure account subscription ID"
  default     = "c9f1d20d-93f8-4f21-89ca-fc1d23159e4b"
  sensitive   = true
}

# Azure tenant ID
variable "tenant_id" {
  type        = string
  description = "Azure Service Principal tenant ID"
  default     = "65841dd3-a2c5-4c28-a795-4c66667b6e13"
}

# Azure client ID
variable "client_id" {
  type        = string
  description = "Azure Service Principal client ID"
  default     = "49ed09ea-8b32-4342-945f-2de5746b2ad6"
}

# Azure client secret
variable "client_secret" {
  type        = string
  description = "Azure Service Principal client secret"
  sensitive   = true
}

# Azure Location
variable "location" {
  type        = string
  description = "Azure Region where all these resources will be provisioned"
  default     = "East US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
  default     = "pfe-gitops"
}

# Azure AKS Environment Name
variable "environment" {
  type        = string
  description = "This variable defines the Environment"
  default     = "dev"
}

# AKS Input Variables
variable "ssh_public_key" {
  type        = string
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
  sensitive   = true
}