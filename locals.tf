locals {
  application_short_name = "microservicesboilerplate"
  resource_group_name    = "${var.resource_group_name}-${terraform.workspace}"
  environment            = terraform.workspace
  region                 = var.region
  subnet_name            = "subnet_${terraform.workspace}"
  tags = {
    resource_group_name    = local.resource_group_name
    region                 = local.region
    application_short_name = local.application_short_name
    environment            = local.environment
    subscription_id        = var.subscription_id
    terraform              = "true"
  }

  #   //postgresql local variables
  #   restore_server_name              = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-restore"
  #   postgres_restore_vnet_rule_name  = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-restore-vnet-rule"
  #   daml_server_name                 = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-daml"
  #   daml_postgres_vnet_rule_name     = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-daml-vnet-rule"
  #   daml_postgres_firewall_rule_name = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-daml-firewall-rule"
  #   kc_server_name                   = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-keycloak"
  #   kc_postgres_vnet_rule_name       = "${local.business_unit}${local.application_short_name}${local.environment}-postgresql-keycloak-vnet-rule"

  #   subnet_private_a  = data.terraform_remote_state.network.outputs.subnet_private_names["default"]
  #   subnet_public_a   = data.terraform_remote_state.network.outputs.subnet_public_names["default"]
  #   subnet_private    = data.terraform_remote_state.network.outputs.subnet_private_names["default"]
  #   subnet_public     = data.terraform_remote_state.network.outputs.subnet_public_names["default"]
  #   subnet_public_id  = data.terraform_remote_state.network.outputs.subnet_public_ids["default"]
  #   subnet_private_id = data.terraform_remote_state.network.outputs.subnet_private_ids["default"]
}
