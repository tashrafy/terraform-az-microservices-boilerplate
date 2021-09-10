variable "resource_group_name" {
  description = "Microsoft Azure Resource Group Name"
}

variable "region" {
  description = "Microsoft Azure Region"
}

variable "replica_region" {
  description = "Microsoft Azure Replica Region"
  default     = "eastus2"
}

variable "replica_mode" {
  description = "Microsoft Azure Relication Mode"
  default     = "Replica"
}

variable "postgres_version" {
  description = "Microsoft Azure Server for Postgres Version"
  default     = "11"
}

variable "sku_name" {
  description = "Microsoft Azure Server for Postgres SKU"
  default     = "GP_Gen5_2"
}

variable "postgres_storage" {
  description = "Microsoft Azure Server for Postgres Storage Space"
  default     = 5120
}

variable "postgres_backup_retention" {
  description = "Microsoft Azure Server for Postgres Storage Space"
  default     = 7
}

variable "postgres_is_grs" {
  description = "Microsoft Azure Server for Postgres Geo Redundant Storage Toggle"
  default     = true
}

variable "postgres_charset" {
  description = "Microsoft Azure Server for Postgres Charset"
  default     = "UTF8"
}

variable "postgres_collation" {
  description = "Microsoft Azure Server for Postgres Collation"
  default     = "English_United States.1252"
}

variable "postgres_firewall_start_ip_address" {
  description = "Microsoft Azure Server for Postgres Firewall Starting IP Address.  A value of 0.0.0.0 denotes access to internal Azure services."
  default     = "0.0.0.0"
}

variable "postgres_firewall_end_ip_address" {
  description = "Microsoft Azure Server for Postgres Firewall Ending IP Address. A value of 0.0.0.0 denotes access to internal Azure services."
  default     = "0.0.0.0"
}

variable "postgres_admin_username" {
  description = "Microsoft Azure Server for Postgres Admin Login Username"
  default     = "psqladminun"
}

variable "postgres_admin_password" {
  description = "Microsoft Azure Server for Postgres Admin Login Password"
  sensitive   = true
  default     = "H@Sh1CoR3!"
}

variable "tags" {
  description = "Map of attributes for this particular project/workspace."
  type        = map(string)
}

variable "application_short_name" {
  description = "Application Name"
}

variable "auto_grow" {
  description = "Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload."
  default     = true
}

variable "database_service_name" {
  description = "Name of the Postgres Database"
  default     = "microservices-postgres-db"
}

variable "database_service_name_replica" {
  description = "Name of the Postgres Database"
  default     = "microservices-postgres-db-replica"
}

variable "firewall_service_name" {
  description = "Name for the Postgres Firewall Service Rules"
  default     = "microservices-postgres-firewall"
}

variable "main_postgres_vnet_rule_name" {
  description = "Name for the Postgres vnet Rule"
  default     = "microservices-postgres-vnet"
}

variable "replica_postgres_vnet_rule_name" {
  description = "Name for the Postgres vnet Rule"
  default     = "microservices-postgres-vnet-replica"
}
