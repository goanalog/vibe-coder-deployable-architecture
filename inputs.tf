variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key"
}

variable "location" {
  type        = string
  default     = "us-south"
  description = "IBM Cloud region where resources will be created"
}

variable "make_public" {
  type        = bool
  default     = true
  description = "Whether the SPA bucket should be public"
}

variable "vibe_code" {
  type        = string
  description = "Live-editable SPA HTML"
}
