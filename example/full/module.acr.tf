module "acr" {
  source = "../../"
  acr = {
    name                = "Checkov"
    resource_group_name = "pike"
    location            = "uksouth"
    sku                 = "Premium"
  }
  replications = [{
    location                  = "spaincentral"
    regional_endpoint_enabled = false
    tags = {
      "key" = "value"
    }
    zone_redundancy_enabled = false
  }]
  encryption = {
    enabled            = true
    identity_client_id = azurerm_user_assigned_identity.pike.client_id
    key_vault_key_id   = data.azurerm_key_vault_key.pike.id
  }
}
