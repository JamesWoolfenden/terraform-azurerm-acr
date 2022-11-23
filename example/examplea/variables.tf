variable "acr" {
  type = object({
    name                = string,
    resource_group_name = string
    location            = string
    sku                 = string
  })
  default = {
    name                = "Checkov"
    resource_group_name = "pike"
    location            = "uksouth"
    sku                 = "Premium"
  }
}

variable "replications" {
  type = list(object({
    location                  = string
    regional_endpoint_enabled = bool
    zone_redundancy_enabled   = bool
    tags                      = map(string)
  }))
  default = [{
    location                  = "spaincentral"
    regional_endpoint_enabled = false
    tags = {
      "key" = "value"
    }
    zone_redundancy_enabled = false
  }]
}

variable "encryption" {
  type = object({
    enabled            = bool
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = {
    enabled            = false
    identity_client_id = null
    key_vault_key_id   = null
  }
}
