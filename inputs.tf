variable "ibmcloud_api_key" {
  type        = string
  sensitive   = true
  description = "Your IBM Cloud API key. Required for Terraform to create resources."
}

variable "location" {
  type        = string
  default     = "us-south"
  description = "IBM Cloud region for the COS bucket (e.g., us-south, eu-de)."
}

variable "html_content" {
  type        = string
  description = "Paste your HTML here for the hosted SPA."
  default     = "<h1>Welcome to Vibe Coder!</h1><p>Your instant SPA is live.</p>"
}

variable "make_public" {
  type        = bool
  default     = true
  description = "If true, makes the SPA publicly accessible via a bucket policy."
}

variable "resource_group_name" {
  type        = string
  default     = "Default"
  description = "The resource group name where resources will be deployed."
}

variable "bucket_name_prefix" {
  type        = string
  default     = "vibe-coder-sample"
  description = "Prefix for your COS bucket name (random suffix added automatically)."
}

variable "cos_instance_name" {
  type        = string
  default     = "vibe-coder-cos"
  description = "Name for the new Cloud Object Storage instance."
}
