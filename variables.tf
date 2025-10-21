variable "cos_bucket_name" {
  description = "Name your IBM Cloud Object Storage bucket."
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

variable "pasted_code" {
  description = "Paste your SPA code (HTML) here."
  type        = string
  default     = <<-EOT
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vibe Coder Sample SPA</title>
</head>
<body>
  <h1>🎉 Welcome to Vibe Coder!</h1>
  <p>Your instant SPA is live in IBM COS.</p>
</body>
</html>
EOT

  validation {
    condition     = length(var.pasted_code) > 0
    error_message = "Pasted SPA code cannot be empty."
  }
}
