variable "cos_bucket_name" {
  description = "The name of the IBM COS bucket where the SPA will be hosted."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_region" {
  description = "The IBM Cloud region where the COS bucket will be created."
  type        = string
  default     = "us-south"
}

variable "cos_resource_group" {
  description = "The resource group to place the COS bucket in."
  type        = string
  default     = "default"
}

variable "index_html_path" {
  description = "Path to your SPA index.html file in the repository."
  type        = string
  default     = "sample-index.html"
}

variable "public_access" {
  description = "Whether to make the bucket publicly readable (needed for SPA hosting)."
  type        = bool
  default     = true
}
