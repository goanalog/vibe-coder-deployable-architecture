variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key. Don't worry, this stays secret."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region to deploy resources in."
  type        = string
  default     = "us-south"
}

variable "cos_name" {
  description = "Name of the Cloud Object Storage service instance."
  type        = string
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  description = "Name of the COS bucket to host your sample app."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Set to true if the bucket should be public."
  type        = bool
  default     = true
}

variable "sample_app_html" {
  description = "Your sample SPA HTML content. Don't worry, a default is provided."
  type        = string
  default     = <<EOT
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Vibe Coder Sample App</title>
</head>
<body>
<h1>🎵 Welcome to Vibe Coder!</h1>
<p>Your instant IBM COS-hosted sample SPA.</p>
</body>
</html>
EOT
}
