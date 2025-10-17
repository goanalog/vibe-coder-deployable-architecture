variable "region" {
  description = "IBM Cloud region to deploy resources"
  type        = string
  default     = "us-south"
}

variable "bucket_name" {
  description = "Name of the Cloud Object Storage bucket"
  type        = string
}

variable "make_public" {
  description = "Whether to make the bucket public"
  type        = bool
  default     = true
}

variable "cos_instance_crn" {
  description = "CRN of the Cloud Object Storage instance"
  type        = string
}

variable "index_file_path" {
  description = "Local path to the index.html file to upload"
  type        = string
  default     = "index.html"
}

variable "cos_name" {
  description = "Short name for the COS instance (used for resource key)"
  type        = string
  default     = "vibe-coder-cos"
}
