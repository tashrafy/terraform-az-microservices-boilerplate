resource "azurerm_kubernetes_cluster" "main" {
  tags                = local.tags
  name                = local.name
  location            = local.region
  dns_prefix          = local.cluster_prefix
  resource_group_name = local.resource_group_name
  node_resource_group = local.aks_resource_group_name

  default_node_pool {
    name                = "default"
    vm_size             = var.aks_vm_size
    enable_auto_scaling = true
    os_disk_size_gb     = var.aks_os_disk_size
    min_count           = var.aks_min_nodes
    max_count           = var.aks_max_nodes
    vnet_subnet_id      = var.subnet_id.*.id[0]
    # availability_zones  = var.aks_zone
  }

  # linux_profile {
  #   admin_username = var.kubernetes_admin

  # ssh_key {
  # key_data = local.ssh_key
  # }
  # }

  windows_profile {
    admin_username = "azureuser"
    admin_password = "2jIK0mYjNX7H2xa5qskZ"
  }

  identity {
    type = "SystemAssigned"
  }


  role_based_access_control {
    enabled = false
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  addon_profile {
    aci_connector_linux {
      enabled     = false
      subnet_name = var.subnet_id.*.name[0]
    }

    http_application_routing {
      enabled = false
    }

    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id
    }

  }

  # provisioner "local-exec" {
  #   command = "az login --service-principal --username ${var.client_id} --tenant ${var.tenant_id} --password ${var.client_secret}"
  # }

  # provisioner "local-exec" {
  #   command = "az account list --output table"
  # }

  # provisioner "local-exec" {
  #   command = "az account set --subscription ${var.subscription_id}"
  # }

  # provisioner "local-exec" {
  #   command = "az feature register --name AKS-IngressApplicationGatewayAddon --namespace microsoft.containerservice"
  # }

  # provisioner "local-exec" {
  #   command = "az extension add --name aks-preview"
  # }

  # provisioner "local-exec" {
  #   command = "az aks update -n ${azurerm_kubernetes_cluster.main.name} --resource-group ${local.resource_group_name} --attach-acr ${var.acr_resource_name}"
  # }

  # provisioner "local-exec" {
  #   command = "az aks get-credentials --resource-group ${local.resource_group_name} --name ${azurerm_kubernetes_cluster.main.name} --subscription ${var.subscription_id}  --overwrite-existing"
  # }

  # provisioner "local-exec" {
  #   command = "az aks enable-addons --resource-group ${local.resource_group_name} --name ${azurerm_kubernetes_cluster.main.name} -a ingress-appgw --appgw-id ${var.appgw_resource_id}"
  # }

  # Create a service principal and read in the application ID
  # provisioner "local-exec" {
  #   command = <<EOT
  #    SP=$(az ad sp create-for-rbac --output json)
  #    SP_ID=$(echo $SP | jq -r .appId)
  #    SP_PASSWORD=$(echo $SP | jq -r .password)
  #    EOT
  # }
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "k8s-workspace-${var.tags.environment}"
  location            = var.tags.region
  resource_group_name = var.tags.resource_group_name
  sku                 = "PerGB2018"
}