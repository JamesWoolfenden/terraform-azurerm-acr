module "acr" {
  source       = "../../"
  acr          = var.acr
  replications = var.replications
  encryption   = var.encryption
}
