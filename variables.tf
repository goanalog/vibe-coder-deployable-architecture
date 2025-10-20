variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key from Schematics/DA input"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-south"
}

variable "bucket_name" {
  description = "Name of the COS bucket"
  type        = string
  default     = ""
}

variable "make_public" {
  description = "Whether the bucket should be publicly accessible"
  type        = bool
  default     = true
}

variable "index_file_path" {
  description = "Local path to index.html to upload to the bucket"
  type        = string
  default     = "sample-app/index.html"
}

variable "cos_name" {
  description = "COS instance name"
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_instance_crn" {
  description = "COS instance CRN (auto-resolved from cos_name)"
  type        = string
  default     = ""
}
