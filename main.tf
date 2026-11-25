resource "azurerm_resource_group" "shimla" {
    for_each = var.rg
  name     = each.value.name
  location = each.value.location
}

# virtual network
resource "azurerm_virtual_network" "vent" {
for_each = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  
}

resource "azurerm_subnet" "kumar" {
for_each= var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes    = each.value.address_prefixes


}