# Expose catalog inputs to Terraform
variable "api_key" {
  description = "IBM Cloud API Key — don't worry, this is secure!"
  type        = string
}

variable "region" {
  description = "IBM Cloud region to deploy to"
  type        = string
  default     = "us-south"
}

variable "bucket_name" {
  description = "COS bucket name for your SPA"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "spa_file_path" {
  description = "Path to the SPA index.html file to auto-upload"
  type        = string
  default     = "sample-app/index.html"
}
