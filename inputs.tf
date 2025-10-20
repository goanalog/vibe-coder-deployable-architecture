variable "cos_bucket_name" {
  type        = string
  description = "The name of the IBM COS bucket where your SPA will be hosted."
}

variable "make_public" {
  type        = bool
  description = "Set to true to make the SPA publicly accessible."
  default     = true
}

variable "region" {
  type        = string
  description = "IBM Cloud region where COS will be deployed."
  default     = "us-south"
}

variable "custom_html" {
  type        = string
  description = "Optional: paste your HTML code here. If empty, the default sample SPA will be used."
  default     = ""
}
