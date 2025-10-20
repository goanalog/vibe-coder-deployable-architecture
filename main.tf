provider "ibm" {
  ibmcloud_api_key = "YOUR_API_KEY_HERE"  # Replace with secure catalog input
  region           = "us-south"
}

# COS Resource Instance
resource "ibm_resource_instance" "cos" {
  name     = "vibe-coder-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "us-south"
}

# COS Bucket for SPA hosting
resource "ibm_cos_bucket" "sample" {
  bucket      = "vibe-coder-sample-bucket"
  instance_id = ibm_resource_instance.cos.id
}
