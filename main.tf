provider "ibm" {
  ibmcloud_api_key = var.api_key
  region           = "us-south"
}

# Create a COS service instance
resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "us-south"
}

# Create a COS bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  name                 = var.cos_name
  resource_instance_id = ibm_resource_instance.cos_instance.id
  access               = "private"
}

# Upload the pasted HTML as index.html
resource "ibm_cos_bucket_object" "html_spa" {
  bucket  = ibm_cos_bucket.vibe_spa_bucket.name
  key     = "index.html"
  content = var.vibe_html
}
