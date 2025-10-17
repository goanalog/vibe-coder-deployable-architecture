###############################################################################
# Vibe Coder — Instant Sample App
# Terraform input variables for IBM Cloud Schematics & Catalog UI
###############################################################################

variable "cos_name" {
  description = "Name of your IBM Cloud Object Storage instance — where your vibe-coded app will live."
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_plan" {
  description = "Choose the COS service plan. 'lite' gives you free storage for your sample apps."
  type        = string
  default     = "lite"
}

variable "region" {
  description = "Pick the IBM Cloud region closest to your users for faster vibe delivery."
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  description = "Select which resource group to place your COS instance in."
  type        = string
  default     = "Default"
}

variable "bucket_name" {
  description = "Optional: specify a custom bucket name. If left empty, one will be auto-generated."
  type        = string
  default     = ""
}

variable "sample_app_html" {
  description = "Paste your sample app (HTML) here — or leave blank to use the included starter sample. When you redeploy, this content will be uploaded to your IBM COS bucket as 'index.html'."
  type        = string
  default     = ""
}

variable "make_public" {
  description = "If true, your sample app will be publicly accessible from a URL. Set to false for private vibes."
  type        = bool
  default     = true
}

###############################################################################
# Advanced options (hidden or optional in most UI cases)
###############################################################################

variable "cos_storage_class" {
  description = "COS bucket storage class (standard, vault, cold, etc.). Standard is ideal for web hosting."
  type        = string
  default     = "standard"
}

variable "html_file_path" {
  description = "Internal use: path to the sample app’s HTML file included with the repo."
  type        = string
  default     = "sample-app/index.html"
}
