variable "ibmcloud_api_key" {
  description = "IBM Cloud API key for provisioning resources"
  type        = string
  sensitive   = true
}

variable "vibe_code" {
  description = "Your vibe-coded HTML/SPA content"
  type        = string
}
