variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region to deploy resources in"
  type        = string
  default     = "us-south"
}

variable "cos_bucket_name" {
  description = "COS bucket name for the SPA"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "vibe_code" {
  description = "The HTML content of your SPA"
  type        = string
}
