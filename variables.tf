variable "cos_bucket_name" {
  description = "Name your IBM Cloud Object Storage bucket."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_id" {
  description = "IBM COS service instance ID. Required to create the bucket."
  type        = string
}

variable "cos_bucket_location" {
  description = "COS bucket location/region. Default is 'us-south'."
  type        = string
  default     = "us-south"
}

variable "pasted_code" {
  description = "Optional: Paste your SPA code (HTML) here."
  type        = string
  default     = "" # Changed from HTML block to empty string
  
  # Validation block removed to make it optional
}

variable "api_key" {
  description = "Your IBM Cloud API key. This will be used to configure the provider."
  type        = string
  sensitive   = true
}