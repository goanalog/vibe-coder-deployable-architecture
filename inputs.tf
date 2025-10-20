variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key. Required for Terraform to create resources."
  sensitive   = true
}

variable "location" {
  type        = string
  description = "The IBM Cloud location to deploy resources (e.g., us-south, eu-de)."
  default     = "us-south"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the IBM Cloud resource group to deploy into."
  default     = "default"
}

variable "cos_instance_name" {
  type        = string
  description = "Name of the IBM Cloud Object Storage instance to create."
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  type        = string
  description = "Name of the COS bucket to host your HTML SPA."
  default     = "vibe-coder-sample-bucket"
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