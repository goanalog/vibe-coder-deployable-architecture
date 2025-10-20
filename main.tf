provider "ibm" {
  ibmcloud_api_key = var.api_key
  region           = var.region
}

resource "ibm_resource_instance" "cos" {
  name     = "vibe-coder-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region
}

resource "ibm_cos_bucket" "sample" {
  bucket      = var.bucket_name
  instance_id = ibm_resource_instance.cos.id
}

resource "ibm_cos_object" "index" {
  bucket       = ibm_cos_bucket.sample.bucket
  instance_id  = ibm_cos_bucket.sample.instance_id
  key          = "index.html"
  source       = var.spa_file_path
  content_type = "text/html"
}
