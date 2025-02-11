resource "azurerm_ssh_public_key" "example" {
  name                = random_pet.ssh_key_name.id # You can still use random_pet for the name
  resource_group_name = azurerm_resource_group.rg.name # Use the name property
  location            = azurerm_resource_group.rg.location
  public_key          = tls_private_key.example.public_key_openssh # Use the public key from tls_private_key
}

resource "tls_private_key" "example" {
 algorithm = "RSA"
}

output "public_key_pem" {
  value     = tls_private_key.example.public_key_pem
  sensitive = true
}

output "private_key_pem" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value     = tls_private_key.example.public_key_openssh
  sensitive = true
}

output "private_key_openssh" {
  value     = tls_private_key.example.private_key_openssh
  sensitive = true
}