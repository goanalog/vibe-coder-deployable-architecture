variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "ibm_region" {
  description = "IBM Cloud region, e.g., us-south"
  type        = string
  default     = "us-south"
}

variable "resource_group_id" {
  description = "ID of the IBM Cloud Resource Group"
  type        = string
}

variable "cos_name" {
  description = "IBM COS instance name"
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_bucket_name" {
  description = "COS bucket name for the SPA"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_bucket_location" {
  description = "COS bucket location (region)"
  type        = string
  default     = "us-south"
}

variable "vibe_code" {
  description = "Paste your HTML code for the Vibe Coder SPA here"
  type        = string
  default     = "<!DOCTYPE html><html><head><title>Vibe Coder</title></head><body><h1>Hello, Vibe!</h1></body></html>"
}
