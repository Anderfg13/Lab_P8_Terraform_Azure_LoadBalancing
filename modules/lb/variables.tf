variable "resource_group_name" {
	type        = string
	description = "Resource Group donde se despliega el Load Balancer y NSG."
}

variable "location" {
	type        = string
	description = "Region de Azure para recursos de balanceo y seguridad."
}

variable "prefix" {
	type        = string
	description = "Prefijo para nombrar recursos del modulo LB."
}

variable "backend_nic_ids" {
	type        = list(string)
	description = "Lista de NIC IDs backend a asociar al pool del LB."
}

variable "allow_ssh_from_cidr" {
	type        = string
	description = "Rango CIDR autorizado para SSH a las VMs backend."
}

variable "tags" {
	type        = map(string)
	description = "Tags comunes para recursos del modulo."
}
