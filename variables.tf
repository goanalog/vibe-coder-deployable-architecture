variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key for Terraform authentication — don't worry, it's safe and required."
  type        = string
  sensitive   = true
}

variable "cos_bucket_name" {
  description = "The name of the IBM COS bucket where your SPA will be hosted. Don't worry, pick something unique!"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_bucket_location" {
  description = "The IBM Cloud region to host your COS bucket (e.g., us-south)."
  type        = string
  default     = "us-south"
}

variable "html_content" {
  description = "The HTML content for your SPA. Paste it here or update later!"
  type        = string
  default     = "<!DOCTYPE html><html><head><title>Vibe Coder SPA</title></head><body><h1>Hello Vibe Coder!</h1></body></html>"
}
