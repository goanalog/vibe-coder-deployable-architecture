###############################################################################
# Vibe Coder — IBM COS SPA Hosting
###############################################################################

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Optional: resource group
data "ibm_resource_group" "rg" {
  name = var.resource_group
}

###############################################################################
# COS Bucket
###############################################################################
resource "ibm_cos_bucket" "bucket" {
  name          = var.bucket_name != "" ? var.bucket_name : "vibe-coder-${timestamp()}"
  location      = var.region
  resource_group_id = data.ibm_resource_group.rg.id
  storage_class = var.cos_storage_class
}

###############################################################################
# Upload SPA index.html
###############################################################################
resource "ibm_cos_bucket_object" "index" {
  bucket = ibm_cos_bucket.bucket.name
  key    = "index.html"
  source = var.html_file_path

  # Optional: set content type using metadata
  metadata = {
    "Content-Type" = "text/html"
  }
}

###############################################################################
# Make public if requested
###############################################################################
resource "ibm_cos_bucket_policy" "public_policy" {
  bucket = ibm_cos_bucket.bucket.name
  policy = var.make_public ? jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": ["s3:GetObject"],
        "Resource": ["arn:aws:s3:::${ibm_cos_bucket.bucket.name}/*"]
      }
    ]
  }) : ""
}

output "public_url" {
  value = var.make_public ? "https://${ibm_cos_bucket.bucket.name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html" : "Bucket is private"
}
