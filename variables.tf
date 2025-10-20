variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
  type        = string
}

variable "region" {
  description = "Region to deploy resources in"
  type        = string
  default     = "us-south"
}

variable "cos_name" {
  description = "IBM COS instance name"
  type        = string
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  description = "COS bucket name"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Whether to make the COS bucket public"
  type        = bool
  default     = true
}

variable "sample_app_html" {
  description = "HTML content of the sample SPA; paste new HTML here to override the default."
  type        = string
  default     = ""
}
