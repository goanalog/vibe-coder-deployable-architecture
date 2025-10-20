variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into."
  type        = string
  default     = "default"
}

variable "bucket_name_prefix" {
  description = "The prefix for the new COS bucket name."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_name" {
  description = "The name for the new COS service instance."
  type        = string
  default     = "vsibe-coder-cos"
}

variable "region" {
  description = "The region to deploy the COS bucket in (e.g., us-south)."
  type        = string
  default     = "us-south"
}