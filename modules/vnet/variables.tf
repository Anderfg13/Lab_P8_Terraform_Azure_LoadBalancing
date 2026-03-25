variable "resource_group_name" {
	type        = string
	description = "Nombre del Resource Group donde se desplegara la red."
}

variable "location" {
	type        = string
	description = "Region de Azure para la VNet y subredes."
}

variable "prefix" {
	type        = string
	description = "Prefijo para nombrar recursos de red."
}

variable "tags" {
	type        = map(string)
	description = "Tags comunes a aplicar en recursos del modulo."
}
