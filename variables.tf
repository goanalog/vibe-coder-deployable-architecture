variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key. Don't worry, this is required for authenticating Terraform with IBM Cloud."
  type        = string
}

variable "region" {
  description = "IBM Cloud region where resources will be created."
  type        = string
  default     = "us-south"
}

variable "bucket_name" {
  description = "The name of the IBM COS bucket that will host the sample app."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Whether to make the COS bucket public. Set to true to allow public access to the sample app."
  type        = bool
  default     = true
}

variable "cos_name" {
  description = "The IBM COS instance name."
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_crn" {
  description = "The IBM COS CRN where the sample app will be uploaded. Provide a CRN or use the instance created by this blueprint."
  type        = string
}

variable "sample_app_html" {
  description = "Optional: Provide HTML for the sample app. If left blank, a default HTML page is deployed. Pastes will overwrite the existing app."
  type        = string
  default = <<EOT
<!DOCTYPE html>
<html>
<head>
  <title>Vibe Coder Sample App</title>
  <style>
    body { font-family: sans-serif; text-align: center; padding: 2rem; }
  </style>
</head>
<body>
  <h1>Welcome to Vibe Coder!</h1>
  <p>This HTML was provided via Catalog input.</p>
</body>
</html>
EOT
}
