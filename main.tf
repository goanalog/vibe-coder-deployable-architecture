provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

# Create COS bucket
resource "ibm_cos_bucket" "spa_bucket" {
  bucket = "vibe-coder-sample-bucket"
  location = var.location
  force_destroy = true
}

# Write the vibe_code input to a local file
resource "local_file" "vibe_code_file" {
  filename = "${path.module}/vibe_code.html"
  content  = var.vibe_code
}

# Upload the HTML file to COS
resource "ibm_cos_bucket_object" "html_spa" {
  bucket = ibm_cos_bucket.spa_bucket.name
  key    = "index.html"
  source = local_file.vibe_code_file.filename

  acl = var.make_public ? "public-read" : "private"
}
