variable "cos_instance_name" {
  type        = string
  description = "Name your IBM Cloud Object Storage instance. Will be created if missing."
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket for your SPA. Auto-generated if empty."
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  type        = bool
  description = "Whether your SPA is publicly accessible. Default is true."
  default     = true
}

variable "html_content" {
  type        = string
  description = "Paste your HTML here; this content will become index.html."
  default     = "<h1>Welcome to Vibe Coder!</h1><p>Your instant SPA is live.</p>"
}
