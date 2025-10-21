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
  description = "Paste your Vibe Code HTML here to create the SPA."
  default     = <<EOT
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
EOT
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into."
  type        = string
  default     = "Default"
}

variable "bucket_name_prefix" {
  description = "The prefix for the new COS bucket name."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_name" {
  description = "The name for the new COS service instance."
  type        = string
  default     = "vibe-coder-cos"
}

variable "location" {
  description = "The IBM Cloud location to deploy the COS bucket in (e.g., us-south)."
  type        = string
  default     = "us-south"
}
