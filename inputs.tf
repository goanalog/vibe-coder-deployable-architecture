variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key. Don't worry, this is just for provisioning."
  type        = string
  default     = ""  # You can leave empty and pass via environment if you prefer
}

variable "region" {
  description = "IBM Cloud region to deploy resources in"
  type        = string
  default     = "us-south"  # Set your preferred default region here
}

variable "cos_name" {
  description = "Name of the IBM Cloud Object Storage instance where your app will live"
  type        = string
  default     = "vibe-coder-cos"
}

variable "bucket_name" {
  description = "Name of the COS bucket to host the SPA"
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "make_public" {
  description = "Whether to make the COS bucket public"
  type        = bool
  default     = true
}

variable "sample_app_html" {
  description = "Optional default HTML content for the sample app (vibe coding starter)"
  type        = string
  default     = <<EOT
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vibe Coder Sample</title>
</head>
<body>
  <h1>Welcome to Vibe Coder!</h1>
  <p>This is your instant SPA hosted on IBM Cloud Object Storage.</p>
</body>
</html>
EOT
}
