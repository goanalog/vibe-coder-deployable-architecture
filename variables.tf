variable "cos_name" {
  description = "Name of the Cloud Object Storage instance."
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_plan" {
  description = "The plan for the COS instance."
  type        = string
  default     = "lite"
}

variable "region" {
  description = "Region to deploy resources in."
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  description = "The IBM Cloud resource group to use."
  type        = string
  default     = "Default"
}

variable "sample_app_html" {
  description = <<DESC
Smart default HTML content for your web app.
If you paste your own code here (or override via UI input),
it completely replaces this sample. Totally vibes.
DESC
  type    = string
  default = file("${path.module}/sample-app/index.html")
}
