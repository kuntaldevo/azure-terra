/* Configure Azure Provider & Declare All The Variables That Will be Used in Terraform Configuration */

provider "azurerm" {
  subscription_id = var.subscription_id
//  client_id = var.client_id
//  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}

}
/*This declares some variables*/

variable "location" {
  default = "Central US"
  description = "The Default Location"
}

variable "subscription_id" {
  default = "684e7cc7-152c-4096-be71-3918b80a90fa"
}

variable "client_id" {
  default = "74b702fc-7852-4fb3-a5e3-e1f1394c186e"
  description = "Enter Client ID for Application in Azure AD"
}

variable "client_secret" {
  default = "NskgL.BfkZdL@fZ9U]Gt_7oOxK6FgmB2"
  description = "Enter the Client Secret for Application in Azure AD"
}

variable "tenant_id" {
  description = "Enter the Tenant ID for Application in Azure AD"
  default = "0f4618be-f39c-4b96-a438-6beecbf48e27"
}

variable "resource_group_name" {
  description = "Resource group name that will contain various resources"
}

variable "vnet_cidr" {
  description = "CIDR block for Virtual Network"
}

variable "subnet1_cidr" {
  description = "CIDR block for Subnet within a Virtual Network"
}

variable "subnet2_cidr" {
  description = "CIDR block for Subnet within a Virtual Network"
}

variable "vm_username" {
  description = "Enter admin username to SSH into Linux VM"
}

variable "vm_password" {
  description = "Enter admin password to SSH into VM"
}
