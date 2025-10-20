variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key — don't worry, this is required to authenticate Terraform with IBM Cloud."
  type        = string
}

variable "region" {
  description = "The IBM Cloud region where resources will be created."
  type        = string
  default     = "us-south"
}

variable "cos_name" {
  description = "Name of your IBM Cloud Object Storage instance."
  type        = string
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  description = "The name of the COS bucket that will host your sample app."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Whether the bucket should be public."
  type        = bool
  default     = true
}

variable "cos_crn" {
  description = "The COS instance CRN."
  type        = string
}

variable "sample_app_html" {
  description = "The HTML content for your sample app. Defaults to the local sample-app-index.html."
  type        = string
  default     = file("${path.module}/sample-app-index.html")
}
