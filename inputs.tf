variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key. Required for Terraform to create resources."
  sensitive   = true
}

variable "make_public" {
  type        = bool
  description = "Set to true to make the bucket's content publicly accessible via a URL."
  default     = true
}

variable "vibe_code" {
  type        = string
  description = "Paste your HTML to create an instant SPA. Default sample app included."
  default     = <<HTML
<!DOCTYPE html>
<html>
<head>
  <title>Vibe Coder SPA</title>
  <style>
    body { font-family: sans-serif; text-align: center; padding: 4em; background: #f4f6f8; }
    h1 { color: #0f62fe; }
  </style>
</head>
<body>
  <h1>Welcome to Vibe Coder!</h1>
  <p>Your instant IBM Cloud SPA is live. Start pasting HTML or editing this page to code your vibes!</p>
</body>
</html>
HTML
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to deploy resources into."
  default     = "Default"
}

variable "bucket_name_prefix" {
  type        = string
  description = "The prefix for the new COS bucket name."
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_name" {
  type        = string
  description = "The name for the new COS service instance."
  default     = "vibe-coder-cos"
}

variable "location" {
  type        = string
  description = "The IBM Cloud location to deploy the COS bucket in (e.g., us-south)."
  default     = "us-south"
}
