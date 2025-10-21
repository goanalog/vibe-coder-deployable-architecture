variable "cos_bucket_name" {
  description = "The name of the IBM COS bucket to host your SPA"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_id" {
  description = "The IBM Cloud Object Storage instance ID"
  type        = string
}

variable "cos_bucket_location" {
  description = "The location/region for the COS bucket"
  type        = string
  default     = "us-south"
}

variable "pasted_code" {
  description = "Your SPA HTML code (paste it here)"
  type        = string
}

variable "api_key" {
  description = "IBM Cloud API key (used internally)"
  type        = string
  sensitive   = true
}
