variable "api_key" {
  description = "Your IBM Cloud API key — don’t worry, this will authenticate Terraform."
  type        = string
  sensitive   = true
}

variable "cos_name" {
  description = "Name your IBM Cloud Object Storage instance and bucket."
  type        = string
  default     = "vibe-coder-cos"
}

variable "vibe_html" {
  description = "Paste your Vibe Coder HTML code here — it will be published as index.html in COS."
  type        = string
  default     = "<!DOCTYPE html><html><body><h1>Hello Vibe!</h1></body></html>"
}
