resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = azurerm_resource_group.rg.location
  parent_id = azurerm_resource_group.rg.id

  # Add the identity block for authentication (Service Principal)
  identity {
    type = "None" # Important: Set to "None" when using a Service Principal
  }
}

resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]

  # Important: Depends on the SSH Key resource being created first
  depends_on = [azapi_resource.ssh_public_key]
}

output "key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  sensitive = true # Mark as sensitive
}

output "private_key" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).privateKey
  sensitive = true # Mark as sensitive - handle with extreme care!
}