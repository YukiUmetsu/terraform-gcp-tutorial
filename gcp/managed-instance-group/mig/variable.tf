variable "region" {
  description = "value of region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "value of zone"
  type        = string
  default     = "us-central1-c"
}

variable "project" {
  description = "value of project"
  type        = string
  default     = "single-being-153022"
}

variable "credentials" {
  description = "value of credentials"
  type        = string
  default     = "../../auth/service_account_key.json"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "instance-template-tf" {
  type        = string
  description = "value of instance template"
  default     = "test1"
}

variable "autohealing_health_check" {
  description = "value of auto-healing health check"
  type        = string
  default     = "autohealing-health-check"
}

variable "instance_group_manager" {
  description = "value of instance group manager"
  type        = string
  default     = "instance-group-manager-test1"
}

variable "autoscaler" {
  description = "value of autoscaler"
  type        = string
  default     = "autoscaler-test1"
}