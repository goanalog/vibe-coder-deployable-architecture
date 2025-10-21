variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key — don’t worry, this is required for Vibe Coder to deploy your SPA."
  type        = string
  sensitive   = true
}

variable "cos_bucket_name" {
  description = "Name of the IBM Cloud Object Storage bucket where your SPA will live."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_bucket_location" {
  description = "The IBM Cloud region where your COS bucket will be created."
  type        = string
  default     = "us-south"
}
