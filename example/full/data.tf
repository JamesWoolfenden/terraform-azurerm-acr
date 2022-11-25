

resource "azurerm_user_assigned_identity" "pike" {
  resource_group_name = "pike"
  location            = "uk south"

  name = "registry-uai"
}

data "azurerm_key_vault_key" "pike" {
  name         = "pike"
  key_vault_id = data.azurerm_key_vault.pike.id
}

data "azurerm_key_vault" "pike" {
  resource_group_name = "pike"
  name                = "pike"
}
