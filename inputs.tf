variable "region" {
  description = "IBM Cloud region where resources will be created"
  type        = string
}

variable "cos_name" {
  description = "Name for the IBM COS instance"
  type        = string
}

variable "bucket_name" {
  description = "Name for the COS bucket"
  type        = string
}

variable "make_public" {
  description = "Whether the COS bucket should be public"
  type        = bool
  default     = false
}
