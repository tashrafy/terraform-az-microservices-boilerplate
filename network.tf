resource "azurerm_virtual_network" "main" {
  name                = "vnet-${terraform.workspace}"
  location            = local.region
  resource_group_name = local.resource_group_name
  address_space       = var.vnet_address_space

  subnet {
    name           = "${local.subnet_name}_1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "${local.subnet_name}_2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "${local.subnet_name}_3"
    address_prefix = "10.0.3.0/24"
  }

  depends_on = [
    azurerm_resource_group.main
  ]
}