variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key. Required for Terraform to create resources."
  sensitive   = true
}

variable "make_public" {
  type        = bool
  description = "Whether the bucket should be public."
  default     = true
}

variable "html_content" {
  type        = string
  description = "Paste your HTML code here to create an instant SPA."
  default     = "<h1>Welcome to Vibe Coder!</h1><p>Your instant SPA is live.</p>"
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into."
  type        = string
  default     = "default"
}

variable "bucket_name_prefix" {
  description = "The prefix for the new COS bucket name."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_name" {
  description = "The name for the new COS service instance."
  type        = string
  default     = "vibe-coder-cos"
}

variable "region" {
  description = "The region to deploy the COS bucket in (e.g., us-south)."
  type        = string
  default     = "us-south"
}