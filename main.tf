module "postgres" {
  source = "./modules/postgres"

  resource_group_name    = local.resource_group_name
  region                 = local.region
  tags                   = local.tags
  application_short_name = local.application_short_name

  depends_on = [
    azurerm_resource_group.main
  ]
}

module "aks" {
  source = "./modules/aks"

  tags                  = local.tags
  resource_group_name   = local.resource_group_name
  resource_group_app_id = azurerm_resource_group.main.id
  subscription_id       = var.subscription_id

  region            = local.region
  project_name      = local.application_short_name
  subnet_id         = azurerm_virtual_network.main.subnet
  acr_resource_name = module.acr.resource_name
  pod_replicas      = var.pod_replicas

  depends_on = [
    azurerm_virtual_network.main
  ]
}


module "cdn" {
  source = "./modules/cdn"

  resource_group_name = local.resource_group_name
  region              = var.region
  tags                = local.tags
  blob_host           = module.storage.primary_blob_host

  depends_on = [
    azurerm_resource_group.main
  ]
}

module "acr" {
  source = "./modules/acr"

  resource_group_name = local.resource_group_name
  region              = var.region
  acr_service_name    = "${local.application_short_name}${local.environment}acr"

  depends_on = [
    azurerm_resource_group.main
  ]
}

module "storage" {
  source = "./modules/storage"

  resource_group_name      = local.resource_group_name
  region                   = local.region
  tags                     = local.tags
  storage_replication_type = "GRS"

  depends_on = [
    azurerm_resource_group.main
  ]
}