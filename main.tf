terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.54.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

# --- IBM Cloud provider configuration ---
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

# --- Input variables (embedded) ---
variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key for authenticating resource creation."
  type        = string
  sensitive   = true
}

variable "cos_instance_name" {
  description = "Your IBM Cloud Object Storage instance — don't worry, it’ll be created if it doesn’t exist yet."
  type        = string
  default     = "vibe-coder-cos"
}

variable "cos_bucket_name" {
  description = "The COS bucket to host your vibe-coded app. No worries — one will be created for you."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "vibe_code" {
  description = "Paste your HTML vibe code here — your instant app! A sample is included by default."
  type        = string
  default = <<EOT
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

# --- COS instance and bucket setup ---
resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_instance_name
  service  = "cloud-object-storage"
  plan     = "lite"
  location = "global"
}

resource "ibm_cos_bucket" "vibe_bucket" {
  bucket_name          = var.cos_bucket_name
  resource_instance_id = ibm_resource_instance.cos_instance.id
  region_location      = "us-south"
  storage_class        = "standard"
  force_delete         = true
}

# --- Upload the HTML directly as the hosted app ---
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn  = ibm_cos_bucket.vibe_bucket.crn
  key         = "index.html"
  content     = var.vibe_code
}

# --- Output: public URL for the vibe-coded app ---
output "application_url" {
  description = "Your live vibe-coded SPA URL."
  value       = "https://${ibm_cos_bucket.vibe_bucket.s3_endpoint_public}/${ibm_cos_bucket_object.html_spa.key}"
}
