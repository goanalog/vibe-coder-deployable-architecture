###########################
# IBM Cloud API Key
###########################
variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key. Required to authenticate and create resources."
}

###########################
# COS Instance
###########################
variable "cos_name" {
  type        = string
  description = "Name your IBM Cloud Object Storage instance — where your vibe-coded app will live."
  default     = "vibe-coder-cos"
}

variable "cos_plan" {
  type        = string
  description = "Choose the COS service plan. 'lite' gives you free storage for your sample apps."
  default     = "lite"
}

variable "region" {
  type        = string
  description = "Pick the IBM Cloud region closest to your users for faster vibe delivery."
  default     = "us-south"
}

variable "resource_group" {
  type        = string
  description = "Select which resource group to place your COS instance in."
  default     = "Default"
}

variable "bucket_name" {
  type        = string
  description = "Optional: specify a custom bucket name. If left empty, one will be auto-generated."
  default     = ""
}

variable "sample_app_html" {
  type        = string
  description = "Paste your sample app (HTML) here — or leave blank to use the included starter sample."
  default     = ""
}

variable "make_public" {
  type        = bool
  description = "If true, your sample app will be publicly accessible from a URL. Set to false for private vibes."
  default     = true
}

variable "cos_storage_class" {
  type        = string
  description = "COS bucket storage class (standard, vault, cold, etc.). Standard is ideal for web hosting."
  default     = "standard"
}

variable "html_file_path" {
  type        = string
  description = "Internal use: path to the sample app’s HTML file included with the repo."
  default     = "sample-app/index.html"
}
