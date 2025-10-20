variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key — don't worry, it's safe here."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region where resources will be created"
  type        = string
  default     = "us-south"
}

variable "resource_group_id" {
  description = "Resource group ID for COS instance"
  type        = string
}

variable "cos_name" {
  description = "Name of the IBM Cloud Object Storage instance"
  type        = string
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  description = "Name of the bucket to create"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Whether the bucket should be publicly accessible"
  type        = bool
  default     = false
}

variable "sample_app_html" {
  description = "HTML content for the sample app"
  type        = string
  default     = "<h1>Hello Vibe Coder!</h1>"
}

variable "existing_cos_id" {
  description = "Optional: provide an existing COS instance ID to use instead of creating a new one"
  type        = string
  default     = ""
}
