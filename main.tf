provider "ibm" {
  region = var.region
}

# COS instance
resource "ibm_resource_instance" "cos" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region
}

# COS bucket
resource "ibm_cos_bucket" "sample" {
  bucket_name          = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
}

# Optional: Make bucket public via ACL (requires separate resource)
resource "ibm_cos_bucket_acl" "public_acl" {
  bucket_name = ibm_cos_bucket.sample.bucket_name
  acl         = var.make_public ? "public-read" : "private"
}
