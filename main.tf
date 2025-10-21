# Create a COS instance
resource "ibm_resource_instance" "vibe_cos" {
  name     = "vibe-coder-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "us-south"
}

# Create a COS bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name          = "vibe-coder-sample-bucket"
  resource_instance_id = ibm_resource_instance.vibe_cos.id
}

# Upload the SPA
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn      = ibm_cos_bucket.vibe_spa_bucket.crn
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  key             = "index.html"
  content         = var.vibe_code
}
