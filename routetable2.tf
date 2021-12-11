resource "azurerm_route_table" "routetablename" {
  count               = length(var.route_table)
  name                = var.route_table[count.index]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_route" "route" {
  count               = length(var.route1)
  name                = var.route1[count.index].name
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = var.route_table[0]
  address_prefix      = var.route1[count.index].address_prefix
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address

}
resource "azurerm_subnet_route_table_association" "Spoke1-Associate" {
  subnet_id      = element(azurerm_subnet.subnets.*.id,1)
  route_table_id = element(azurerm_route_table.routetablename.*.id,0)
}

resource "azurerm_route" "route1" {
  count               = length(var.route2)
  name                = var.route2[count.index].name
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = var.route_table[1]
  address_prefix      = var.route2[count.index].address_prefix
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address

}

resource "azurerm_subnet_route_table_association" "Spoke2-Associate" {
  subnet_id      = element(azurerm_subnet.subnets.*.id,0)
  route_table_id = element(azurerm_route_table.routetablename.*.id,1)
}