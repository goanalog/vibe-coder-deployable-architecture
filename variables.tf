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
}

variable "make_public" {
  description = "Whether the bucket should be public"
  type        = bool
  default     = false
}

variable "index_file_path" {
  description = "Local path to index.html to upload to the bucket"
  type        = string
}
