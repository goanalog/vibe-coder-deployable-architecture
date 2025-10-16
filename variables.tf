# -------------------------------------------------------------
# 🪩 Vibe Coder — Instant Sample Application
# A kind, simple Terraform setup that turns your HTML into a
# hosted web app on IBM Cloud Object Storage.
# -------------------------------------------------------------

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.54.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

provider "ibm" {}

# -------------------------------------------------------------
# 🪶 Step 1. Give things a little uniqueness
# We’ll add a random suffix so multiple vibe coders can deploy
# without name collisions. Don’t worry, it’s harmless.
# -------------------------------------------------------------
resource "random_id" "suffix" {
  byte_length = 2
}

# -------------------------------------------------------------
# 🪴 Step 2. Find your resource group
# If you’ve never made one, "Default" works fine.
# -------------------------------------------------------------
data "ibm_resource_group" "selected" {
  name = var.cos_resource_group
}

# -------------------------------------------------------------
# ☁️ Step 3. Create a cozy Object Storage bucket
# This is your app’s “home in the cloud.”
# -------------------------------------------------------------
resource "ibm_cos_bucket" "vibe_bucket" {
  bucket_name       = "${var.cos_bucket_name}-${random_id.suffix.hex}"
  resource_group_id = data.ibm_resource_group.selected.id
  storage_class     = "standard"
  region_location   = var.cos_region

  # Make it public if you said so above
  # Don’t worry: if you’re just testing, this is fine.
  force_delete = true
}

# -------------------------------------------------------------
# 💫 Step 4. Optionally make your bucket public
# Let the world see your app — or keep it private.
# -------------------------------------------------------------
resource "ibm_cos_bucket_policy" "public_read" {
  count = var.public_access ? 1 : 0

  bucket_name = ibm_cos_bucket.vibe_bucket.bucket_name

  policy = <<EOT
{
  "Version": "2.0",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::${ibm_cos_bucket.vibe_bucket.bucket_name}/*"]
    }
  ]
}
EOT
}

# -------------------------------------------------------------
# 🎨 Step 5. Upload your index.html
# If the file doesn’t exist yet, don’t worry — you can upload
# your own later using the IBM Cloud Console or CLI.
# -------------------------------------------------------------
resource "ibm_cos_bucket_object" "index_html" {
  bucket          = ibm_cos_bucket.vibe_bucket.bucket_name
  key             = "index.html"
  source          = var.index_html_path
  etag            = filemd5(var.index_html_path)
  content_type    = "text/html"
  force_destroy   = true
  depends_on      = [ibm_cos_bucket.vibe_bucket]
}

# -------------------------------------------------------------
# 🌐 Step 6. Show your deployment results
# A friendly note so you know where to look.
# -------------------------------------------------------------
output "bucket_name" {
  descri
