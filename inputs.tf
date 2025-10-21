variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API Key"
}

variable "location" {
  type        = string
  default     = "us-south"
  description = "IBM Cloud region to deploy resources"
}

variable "make_public" {
  type        = bool
  default     = true
  description = "If true, the SPA will be publicly accessible"
}

variable "vibe_code" {
  type        = string
  description = "HTML code for the live-editable SPA"
}
