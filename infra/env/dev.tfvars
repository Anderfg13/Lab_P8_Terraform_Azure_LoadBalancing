# Identidad y alcance del despliegue
prefix              = "lab8"
location            = "eastus2"

# Capacidad de backend
vm_count            = 2

# Acceso administrativo
admin_username      = "student"
ssh_public_key      = "~/.ssh/id_ed25519.pub"
allow_ssh_from_cidr = "181.233.145.52/32"

# Metadatos de gobierno/costos
tags                = { owner = "ander", course = "ARSW", env = "dev", expires = "2026-12-31" }