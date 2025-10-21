provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = "us-south"
}

# Create IBM COS instance
resource "ibm_resource_instance" "vibe_cos" {
  name          = "vibe-coder-cos"
  service       = "cloud-object-storage"
  plan          = "standard"
  resource_group = "Default"
  location      = "us-south"
}

# Create COS bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name          = "vibe-coder-sample-bucket"
  resource_instance_id = ibm_resource_instance.vibe_cos.id
}

# Upload the SPA HTML
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn = ibm_cos_bucket.vibe_spa_bucket.crn
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  key = "index.html"
  content = var.vibe_code
  content_type = "text/html"
}
