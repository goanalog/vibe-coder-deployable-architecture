variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
}

variable "region" {
  type        = string
  description = "IBM Cloud region"
  default     = "us-south"
}

variable "cos_name" {
  type        = string
  description = "Name for the COS instance"
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  type        = string
  description = "COS bucket name"
  default     = "vibe-coder-bucket"
}

variable "make_public" {
  type        = bool
  description = "Set to true to make the bucket public"
  default     = true
}

variable "index_file_path" {
  type        = string
  description = "Path to your index.html file"
  default     = "index.html"
}
