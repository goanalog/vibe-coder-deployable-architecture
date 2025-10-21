variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key — used to securely deploy resources. Don’t worry, it’s never stored in your app. You can create one in your IBM Cloud account settings."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Choose your IBM Cloud region (for example: us-south, eu-de, jp-tok). This is where your vibes will live."
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  description = "The resource group where your vibe-coded app will be deployed. If unsure, use 'Default'."
  type        = string
  default     = "Default"
}

variable "cos_name" {
  description = "Name your IBM Cloud Object Storage instance — the container for your hosted vibe code."
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_bucket_name" {
  description = "A unique bucket name for your app’s files (letters, numbers, and dashes)."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "html_content" {
  description = "Paste your vibe code (HTML) here — it will instantly become your hosted app’s index.html."
  type        = string
  default     = "<!DOCTYPE html><html><body><h1>Hello, Vibe Coder!</h1><p>Your HTML goes here.</p></body></html>"
}
