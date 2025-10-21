variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key."
  sensitive   = true
}

variable "location" {
  type        = string
  default     = "us-south"
  description = "IBM Cloud region for the COS bucket."
}

variable "make_public" {
  type        = bool
  default     = true
  description = "If true, the SPA bucket will be publicly accessible."
}

variable "vibe_code" {
  type        = string
  default     = ""
  description = "HTML content for the SPA."
}
