variable "prefix" {
	type        = string
	description = "Prefijo base para nombres de recursos (ej: lab8)."
}

variable "location" {
	type        = string
	description = "Region de Azure donde se desplegara la infraestructura."
}

variable "vm_count" {
	type        = number
	description = "Numero de VMs Linux en el backend del balanceador."

	validation {
		condition     = var.vm_count >= 2
		error_message = "vm_count debe ser al menos 2 para alta disponibilidad basica."
	}
}

variable "admin_username" {
	type        = string
	description = "Usuario administrador configurado en las VMs Linux."
}

variable "ssh_public_key" {
	type        = string
	description = "Clave publica SSH en formato OpenSSH para acceso a las VMs."
}

variable "allow_ssh_from_cidr" {
	type        = string
	description = "CIDR autorizado para SSH (recomendado /32 de la IP del operador)."
}

variable "tags" {
	type        = map(string)
	description = "Tags comunes aplicados a todos los recursos del despliegue."
}
