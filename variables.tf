variable "external_secrets_version" {
  description = "Version of the External Secrets Helm chart"
  type        = string
  default     = "latest" # Set a specific version if needed
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "location" {
  type = string
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "versions" {
  type    = string
  default = "v0.17.0"
}