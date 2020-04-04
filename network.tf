variable "default_tags" {
  type = map
  default = {
    key: "value",
    Name: "Value",
    department: "dept_name",
    team: "dev"
    app: "application",
    env: "azure"
  }
}

locals {
  general_tags = map(
  "group", "LinuxAcademy",
  "role", "kb-role"
  )
}

resource "azurerm_virtual_network" "la_vnet" {
  address_space = [var.vnet_cidr]
  location = var.location
  name = "LA-Terraform-VNet"
  resource_group_name = azurerm_resource_group.terraform_rg.name

#  tags = merge(map(
#          "Special_Key", "Special_Value",
#          )
#  ,local.general_tags, var.default_tags)

  tags = merge(var.default_tags, local.general_tags, map(
    "Name", "management-gateway",
    "flavour", "lemon"
  ))
}

resource "azurerm_subnet" "la_subnet_1" {
  address_prefix = var.subnet1_cidr
  name = "LA-Subnet-1"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.la_vnet.name

}
resource "azurerm_subnet" "la_subnet_2" {
  address_prefix = var.subnet2_cidr
  name = "LA-Subnet-2"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.la_vnet.name
}