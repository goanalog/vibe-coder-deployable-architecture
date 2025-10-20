variable "region" {
  description = "IBM Cloud region to deploy the vibe coder SPA."
}

variable "cos_name" {
  description = "Name of the IBM COS instance for hosting vibe coder apps."
}

variable "bucket_name" {
  description = "Name of the COS bucket for hosting the SPA."
}

variable "make_public" {
  description = "Whether the bucket should be publicly accessible. true = public, false = private."
  default     = false
}

variable "sample_app_html" {
  description = "Optional default HTML content for the vibe coder SPA. Leave empty to use uploaded files."
  default     = <<HTML
<!DOCTYPE html>
<html>
<head>
  <title>Vibe Coder Sample App</title>
  <style>
    body { font-family: sans-serif; background: #f0f0f0; text-align: center; padding: 2rem; }
    h1 { color: #ff6600; }
  </style>
</head>
<body>
  <h1>Welcome to Vibe Coder!</h1>
  <p>Your instant SPA is live on IBM COS.</p>
</body>
</html>
HTML
}
