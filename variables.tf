variable "cos_bucket_name" {
  description = "Name for your new IBM Cloud Object Storage bucket."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_name" {
  description = "Name for your new IBM Cloud Object Storage service instance."
  type        = string
  default     = "vibe-coder-cos-instance"
}

variable "resource_group_id" {
  description = "Optional: The ID of the Resource Group. If left blank, the 'Default' group will be used."
  type        = string
  default     = null # <-- ADDED THIS LINE
}

variable "cos_plan" {
  description = "The plan for the COS service instance."
  type        = string
  default     = "standard"
}

variable "cos_bucket_location" {
  description = "Region where the COS instance and bucket will be created."
  type        = string
  default     = "us-south"
}

variable "pasted_code" {
  description = "Optional: Paste your SPA code (HTML) here."
  type        = string
  default     = ""
}

variable "api_key" {
  description = "Your IBM Cloud API key. This will be used to configure the provider."
  type        = string
  sensitive   = true
  # This is still required, so no default
}