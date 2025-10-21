variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key"
}

variable "location" {
  type    = string
  default = "us-south"
}

variable "make_public" {
  type    = bool
  default = true
}

variable "vibe_code" {
  type        = string
  description = "HTML content for the SPA"
}
