output "lb_public_ip" {
  description = "Direccion IP publica del Azure Load Balancer."
  value       = module.lb.public_ip
}
output "resource_group_name" {
  description = "Nombre del Resource Group que contiene la solucion."
  value       = azurerm_resource_group.rg.name
}
output "vm_names" {
  description = "Lista de nombres de las VMs Linux desplegadas."
  value       = module.compute.vm_names
}
