variable "cos_bucket_name" {
  description = "Name your IBM Cloud Object Storage bucket — it just needs to be unique in your region."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_region" {
  description = "Region where your COS bucket will be created. Example: us-south"
  type        = string
  default     = "us-south"
}
