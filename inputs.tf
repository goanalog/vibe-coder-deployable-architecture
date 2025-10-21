variable "vibe_code" {
  type        = string
  description = "Enter your HTML or SPA code here. This drives the app content."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key for authentication."
  sensitive   = true
}
