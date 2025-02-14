variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 3
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}
variable "AZURE_CLIENT_ID" {
  description = "The Azure Client ID for the Service Principal"
  type        = string
}

variable "AZURE_CLIENT_SECRET" {
  description = "The Azure Client Secret for the Service Principal"
  type        = string
}

variable "AZURE_TENANT_ID" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "AZURE_SUBSCRIPTION_ID" {
  description = "The Azure Subscription ID"
  type        = string
}
variable "ARM_CLIENT_ID" {
  description = "The Azure Client ID for the Service Principal"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "The Azure Client Secret for the Service Principal"
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "The Azure Subscription ID"
  type        = string
}
