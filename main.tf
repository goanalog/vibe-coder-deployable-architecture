provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# COS bucket
resource "ibm_cos_bucket" "bucket" {
  bucket_name      = var.bucket_name
  cos_instance_crn = var.cos_instance_crn
  location         = var.region
  storage_class    = "standard"
  public_access    = var.make_public
}

# Resource key for COS
resource "ibm_resource_key" "cos_key" {
  name       = "${var.cos_name}-key"
  role       = "Writer"
  source_crn = var.cos_instance_crn
}

# Upload index.html to bucket
resource "ibm_cos_bucket_object" "index" {
  bucket_crn     = ibm_cos_bucket.bucket.crn
  bucket_location = ibm_cos_bucket.bucket.location
  key            = "index.html"
  source         = var.index_file_path
}
