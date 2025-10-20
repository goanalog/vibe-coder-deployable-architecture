variable "cos_instance_name" {
  type        = string
  description = "Name your IBM Cloud Object Storage instance — don't worry, it will be created if missing."
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket where your SPA will live — can be auto-generated if not provided."
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  type        = bool
  description = "Whether to make the SPA publicly accessible. Default is true."
  default     = true
}
