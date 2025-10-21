variable "ibmcloud_api_key" {
  description = "IBM Cloud API key — don't worry, it stays safe."
  type        = string
  default     = "YOUR_API_KEY_HERE"
}

variable "cos_bucket_name" {
  description = "Name of the COS bucket to host your SPA — must be globally unique."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "region" {
  description = "IBM Cloud region where resources will be created."
  type        = string
  default     = "us-south"
}

variable "vibe_code" {
  description = "The HTML code you want to host. Paste it here."
  type        = string
  default     = "<!DOCTYPE html><html><head><title>Vibe Coder SPA</title></head><body><h1>Hello Vibe!</h1></body></html>"
}
