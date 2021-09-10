locals {
  name                    = "${var.tags.application_short_name}-${var.tags.environment}-${var.cluster_prefix}-aks"
  cluster_prefix          = var.cluster_prefix
  region                  = var.tags.region
  resource_group_name     = var.tags.resource_group_name
  application_short_name  = var.tags.application_short_name
  environment             = var.tags.environment
  aks_resource_group_name = "${local.application_short_name}-${local.environment}-${var.cluster_prefix}-rg"
  kubernetes_version      = var.kubernetes_version
  kubernetes_client_id    = "data.azurerm_key_vault_secret.kubernetes_client_id.value"
  kubernetes_secret       = "data.azurerm_key_vault_secret.kubernetes_client_secret.value"
  node_public_ip          = "false"
  node_min_count          = var.aks_min_nodes
  node_max_count          = var.aks_max_nodes
  node_taints             = ["key=value:NoSchedule"]
  tags                    = var.tags
  # load_balancer_sku       = var.load_balancer_sku
  # availability_zones      = [var.availability_zones}
  # node_size               = var.node_size

  dockercfg = {
    "${var.docker_server}" = {
      username = "${var.docker_username}"
      password = "${var.docker_password}"
    }
  }

  kubernetes_config_flat            = flatten(azurerm_kubernetes_cluster.main.kube_config)
  kubernetes_config                 = local.kubernetes_config_flat[0]
  kubernetes_host                   = local.kubernetes_config["host"]
  kubernetes_username               = local.kubernetes_config["username"]
  kubernetes_password               = local.kubernetes_config["password"]
  kubernetes_client_certificate     = local.kubernetes_config["client_certificate"]
  kubernetes_client_key             = local.kubernetes_config["client_key"]
  kubernetes_cluster_ca_certificate = local.kubernetes_config["cluster_ca_certificate"]
  kubernetes_node_rg_name           = "${local.application_short_name}-${local.environment}-${local.cluster_prefix}-rg"
}
