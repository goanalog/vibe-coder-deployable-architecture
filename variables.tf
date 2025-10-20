variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key from Schematics/DA input"
  type        = string
  sensitive   = true
}

variable "sample_app_html" {
  description = "The HTML content for your sample app. Leave blank to use the default file."
  type        = string
  default     = ""
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-south"
}

variable "bucket_name" {
  description = "COS bucket name (auto-generated if blank)"
  type        = string
  default     = ""
}

variable "cos_name" {
  description = "IBM Cloud Object Storage instance name"
  type        = string
  default     = "vibe-coder-cos"
}

variable "make_public" {
  description = "Whether the COS bucket should be publicly accessible"
  type        = bool
  default     = true
}
