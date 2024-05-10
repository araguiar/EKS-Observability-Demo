variable "grafana_workspace_name" {
  description = "Grafana workspace name."
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name the workspace is deployed for."
  type        = string
}

variable "region" {
  description = "AWS Region being deployed to."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of VPC subnets used for the cluster subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Cluster VPC Security groups for Grafana access"
  type        = list(string)
}

# variable "vpce_ids" {
#   description = "VPC Endpoint IDs for private Grafana access"    ##Commenting to enable temp public access
#   type        = list(string)
#   default     = [""]
# }

# variable "prefix_list_ids" {
#   description = "Prefix list IDs for private Grafana access"     ##Commenting to enable temp public access
#   type        = list(string)
#   default     = [""]
# }

variable "terraform_execution_role" {
  description = "Role ARN to assume for Terraform execution."
  type        = string
  default     = null
}

variable "grafana_version" {
  description = "Grafana version to deploy."
  type        = string
  default     = "9.4"
}

variable "enable_alerts" {
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

variable "global_tags" {
  description = "Map of key,value pairs to tag all resources."
  type        = map(string)
  default     = {}
}
