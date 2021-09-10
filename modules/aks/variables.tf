variable "cluster_prefix" {
  description = "Contains the dns prefix of the cluster"
  default     = "default"
}

variable "resource_group_name" {
  description = "Microsoft Azure Resource Group Name"
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  default     = "1.17.11"
}

variable "tags" {
  description = "Microsoft Azure Resource Group Name"
  type        = map(string)
}

variable "web_replicas" {
  description = "Number of replicas desired for Web layer deployment"
  default     = 1
}

variable "pod_replicas" {
  description = "Number of replicas desired for microservice deployment"
  default     = 1
}

variable "microservice_replicas" {
  description = "Number of replicas desired for Microservice layer deployment"
  default     = 1
}

variable "acr_resource_name" {
  description = "Microsoft Azure Container Registry Resource Name"
}

# variable "subnet_id" {
#   description = "Microsoft Azure Kubernetes Service Subnet Id"
# }

# variable "log_analytics_workspace_id" {
#   description = "Microsoft Azure Log Analytics Workspace Id"
# }

# variable "virtual_network" {
#   description = "VNET for Azure Kubernetes Cluster"
# }

variable "aks_vm_size" {
  description = "Microsoft Azure Kubernetes Service VM Instance"
  default     = "Standard_D2_v3"
}

variable "aks_zone" {
  description = "Microsoft Azure Kubernetes Service Availability Zones"
  default     = ["1", "2", "3"]
}

variable "aks_os_disk_size" {
  description = "Microsoft Azure Kubernetes Service OS Disk Size for each agent in Node Pool"
  default     = 100
}

variable "aks_min_nodes" {
  description = "Microsoft Azure Kubernetes Service Minimum Number of Nodes in Node Pool"
  default     = 1
}

variable "aks_max_nodes" {
  description = "Microsoft Azure Kubernetes Service Maximum Number of Nodes in Node Pool"
  default     = 5
}

variable "aks_dns_service_ip" {
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)"
  default     = "192.168.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
  default     = "172.17.0.1/16"
}

variable "aks_service_cidr" {
  description = "The Network Range used by the Kubernetes service"
  default     = "192.168.0.0/24"
}

variable "subscription_id" {
  description = "Microsoft Azure Subscription Id"
}

variable "kubernetes_admin" {
  description = "Contains the kubernetes admin username"
  default     = "aksadm"
}

variable "subnet_id" {
  description = "(Optional) The Public SSH Key used to access the cluster. If not specified a new key will be generated & stored in vault. Changing this forces a new resource to be created"
  default     = ""
}

variable "project_name" {
  description = "Terraform Project Name Prefix"
}

variable "region" {
  description = "Microsoft Azure Region"
}

variable "resource_group_app_id" {
  description = "The Type of Routing that should be used for this Rule"
}