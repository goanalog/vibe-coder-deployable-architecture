variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key"
  type        = string
}

variable "location" {
  description = "IBM Cloud location for the COS bucket"
  type        = string
  default     = "us-south"
}

variable "make_public" {
  description = "Make the SPA publicly accessible"
  type        = bool
  default     = true
}

variable "vibe_code" {
  description = "Live-editable SPA HTML"
  type        = string
  default     = <<EOT
<!DOCTYPE html>
<html>
<head>
  <title>Vibe Coder SPA</title>
</head>
<body>
  <h1>Welcome to Vibe Coder!</h1>
  <p>Start editing your vibes!</p>
</body>
</html>
EOT
}
