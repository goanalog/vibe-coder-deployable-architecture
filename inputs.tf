variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key (don’t worry, this will be a secure input in catalog)."
}

variable "region" {
  type        = string
  default     = "us-south"
  description = "IBM Cloud region for your resources."
}

variable "resource_group" {
  type        = string
  default     = "Default"
  description = "IBM Cloud resource group."
}

variable "cos_name" {
  type        = string
  default     = "vibe-coder-cos"
  description = "Name of your IBM COS instance."
}

variable "cos_plan" {
  type        = string
  default     = "standard"
  description = "COS service plan (standard or lite)."
}

variable "bucket_name" {
  type        = string
  default     = "vibe-coder-sample-bucket"
  description = "Bucket name to host the SPA."
}

variable "make_public" {
  type        = bool
  default     = true
  description = "Whether the bucket should be public."
}
