variable "cos_instance_name" {
  type        = string
  description = "Name your IBM Cloud Object Storage instance — don't worry, it will be created if missing."
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket where your SPA will live — auto-generated if empty."
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  type        = bool
  description = "Whether to make your SPA publicly accessible. Default is true."
  default     = true
}

variable "sample_html_enabled" {
  type        = bool
  description = "Include a default sample HTML if no custom code is provided."
  default     = true
}
