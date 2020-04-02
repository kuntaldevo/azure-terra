locals {
  general_tags = map(
  "group", "LinuxAcademy",
  "role", "kb-role"
  )
}

resource "azurerm_virtual_network" "la_vnet" {
  count = 2
  address_space = [var.vnet_cidr]
  location = var.location
  name = "LA-Terraform-VNet-${count.index}"
  resource_group_name = azurerm_resource_group.terraform_rg.name

  tags = local.general_tags
}

resource "azurerm_subnet" "la_subnet_1" {
  address_prefix = var.subnet1_cidr
  name = "LA-Subnet-1"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.la_vnet[0].name

}