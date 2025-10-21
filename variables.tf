variable "cos_name" {
  description = "Name your IBM Cloud Object Storage instance — where your Vibe Coder app will live."
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_bucket_name" {
  description = "The name of the IBM COS bucket where the SPA will be hosted."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_bucket_location" {
  description = "The IBM Cloud region where your COS bucket resides."
  type        = string
  default     = "us-south"
}

variable "resource_group_id" {
  description = "IBM Cloud Resource Group ID where the COS instance and bucket will be created."
  type        = string
}

variable "index_html_file" {
  description = "Optional: Local path to your index.html file to upload to COS."
  type        = string
  default     = ""
}
