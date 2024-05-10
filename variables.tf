variable "cluster_name" {
  description = "EKS cluster name the workspace is deployed for."
  type        = string
}

variable "region" {
  description = "AWS Region being deployed to."
  type        = string
}

##
# Grafana
##
variable "grafana_workspace_name" {
  description = "Grafana workspace name."
  type        = string
}

variable "grafana_private_subnet_ids" {
  description = "List of VPC subnets used for the cluster subnet group"
  type        = list(string)
}

variable "grafana_security_group_ids" {
  description = "Cluster VPC Security groups for Grafana access"
  type        = list(string)
}

variable "grafana_version" {
  description = "Grafana version to deploy."
  type        = string
  default     = "9.4"
}

variable "grafana_enable_alerts" {
  description = "Determines whether IAM permissions for alerting are enabled for the workspace IAM role"
  type        = bool
  default     = true
}

variable "grafana_admin_groups" {
  description = "List of AWS SSO groups to assign as administrators in Amazon Managed Grafana.."
  type        = list(string)
  default     = []
}
variable "grafana_editor_groups" {
  description = "List of AWS SSO groups to assign as editor in Amazon Managed Grafana."
  type        = list(string)
  default     = []
}

variable "grafana_readonly_groups" {
  description = "List of AWS SSO groups to assign as readonly users in Amazon Managed Grafana."
  type        = list(string)
  default     = []
}

##
# Observability Accelerator
##
variable "adot_loglevel" {
  description = "Verbosity level for ADOT Collector"
  type        = string
  default     = "normal"
}

variable "enable_dashboards" {
  description = "Enables or disables curated dashboards. Dashboards are managed by the Grafana Operator"
  type        = bool
  default     = true
}

variable "irsa_iam_role_path" {
  description = "IAM Role path for IRSA"
  type        = string
  default     = "/obs/"
}

variable "alert_email_addresses" {
  description = "Email addressses for Observability alerts"
  type        = list(string)
  default     = []
}

variable "global_tags" {
  description = "Map of key,value pairs to tag all resources."
  type        = map(string)
  default     = {}
}
