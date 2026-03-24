variable "resource_group_name" {
  type        = string
  description = "Resource Group donde se despliegan NICs y VMs."
}

variable "location" {
  type        = string
  description = "Region de Azure para los recursos de compute."
}

variable "prefix" {
  type        = string
  description = "Prefijo de nombres para NICs y VMs."
}

variable "admin_username" {
  type        = string
  description = "Usuario administrador configurado en las VMs."
}

variable "ssh_public_key" {
  type        = string
  description = "Clave publica SSH para acceso administrativo seguro."
}

variable "subnet_id" {
  type        = string
  description = "ID de la subred donde se conectaran las NICs de backend."
}

variable "vm_count" {
  type        = number
  description = "Cantidad de VMs Linux a crear."
}

variable "cloud_init" {
  type        = string
  description = "Contenido cloud-init en texto plano para bootstrap de cada VM."
}

variable "tags" {
  type        = map(string)
  description = "Tags comunes aplicados a recursos del modulo."
}

# Una NIC por VM para facilitar asociacion al backend pool del LB.
resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.prefix}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

# VMs Linux Ubuntu con cloud-init para instalar y configurar nginx.
resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.prefix}-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_B1s"

  admin_username = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  custom_data = base64encode(var.cloud_init)

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = var.tags
}

output "vm_names" {
  description = "Nombres de las VMs Linux creadas."
  value       = [for v in azurerm_linux_virtual_machine.vm : v.name]
}
output "nic_ids" {
  description = "IDs de NICs para asociarlas al backend del LB y al NSG."
  value       = [for n in azurerm_network_interface.nic : n.id]
}
