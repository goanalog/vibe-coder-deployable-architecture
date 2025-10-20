variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
  type        = string
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
}

variable "cos_name" {
  description = "Name of your COS instance"
  type        = string
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  description = "COS bucket name"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Make the bucket public?"
  type        = bool
  default     = true
}

variable "sample_app_html" {
  description = "HTML content of the sample app"
  type        = string
  default     = "<!DOCTYPE html><html><head><title>Vibe Coder SPA</title></head><body><h1>Welcome to Vibe Coder!</h1></body></html>"
}
