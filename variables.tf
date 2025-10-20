variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-south"
}

variable "cos_name" {
  description = "Name of COS instance"
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_crn" {
  description = "COS instance CRN"
  type        = string
}

variable "bucket_name" {
  description = "Custom COS bucket name"
  type        = string
  default     = ""
}

variable "make_public" {
  description = "Make the bucket publicly accessible"
  type        = bool
  default     = true
}

variable "sample_app_html" {
  description = "Paste your HTML code here; overrides sample-app-index.html"
  type        = string
  default     = ""
}
