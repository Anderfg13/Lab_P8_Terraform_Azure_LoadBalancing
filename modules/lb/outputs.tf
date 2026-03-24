output "public_ip" {
	description = "Direccion IP publica expuesta por el frontend del LB."
	value       = azurerm_public_ip.pip.ip_address
}
