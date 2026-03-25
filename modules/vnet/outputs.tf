output "vnet_name" {
	description = "Nombre de la VNet creada por el modulo."
	value       = azurerm_virtual_network.vnet.name
}

output "subnet_web_id" {
	description = "ID de la subred web, usada por el modulo de compute."
	value       = azurerm_subnet.web.id
}
