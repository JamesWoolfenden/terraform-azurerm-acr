resource "azurerm_container_registry" "example" {
  name                   = var.acr.name
  resource_group_name    = var.acr.resource_group_name
  location               = var.acr.location
  sku                    = var.acr.sku
  anonymous_pull_enabled = var.anonymous_pull

  encryption {
    enabled            = var.encryption.enabled
    key_vault_key_id   = var.encryption.key_vault_key_id
    identity_client_id = var.encryption.identity_client_id
  }

  trust_policy {
    enabled = var.trust_policy
  }

  public_network_access_enabled = var.public_network_access

  quarantine_policy_enabled = var.quarantine_policy

  retention_policy {
    enabled = var.retention_policy
  }


  dynamic "georeplications" {
    for_each = var.replications
    content {
      location                  = georeplications.value["location"]
      regional_endpoint_enabled = georeplications.value["regional_endpoint_enabled"]
      zone_redundancy_enabled   = georeplications.value["zone_redundancy_enabled"]
      tags                      = georeplications.value["tags"]
    }
  }
}

variable "replications" {
  type = list(object({
    location                  = string
    regional_endpoint_enabled = bool
    zone_redundancy_enabled   = bool
    tags                      = map(string)
  }))

}


variable "anonymous_pull" {
  type    = bool
  default = false
}

variable "trust_policy" {
  type    = bool
  default = true
}

variable "public_network_access" {
  type    = bool
  default = false
}

variable "quarantine_policy" {
  type    = bool
  default = true
}

variable "retention_policy" {
  type    = bool
  default = true
}

variable "encryption" {
  type = object({
    enabled            = bool
    key_vault_key_id   = string
    identity_client_id = string
  })
}
