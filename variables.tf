variable "cos_bucket_name" {
  description = "Name your IBM Cloud Object Storage bucket — where your SPA will live. Don't worry, it will be created automatically if it doesn't exist."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_id" {
  description = "IBM COS service instance ID. Required to create the bucket."
  type        = string
}

variable "cos_bucket_location" {
  description = "COS bucket location/region. Default is 'us-south'."
  type        = string
  default     = "us-south"
}

variable "local_file" {
  description = "Optional: path to a local SPA file to upload. If left empty, pasted SPA code will be used instead."
  type        = string
  default     = ""
}

variable "pasted_code" {
  description = "Optional: paste your SPA code here if not using a local file."
  type        = string
  default     = ""
}

variable "api_key" {
  description = "Your IBM Cloud API key. We'll surface it so your workspace can use it."
  type        = string
  sensitive   = true
}
