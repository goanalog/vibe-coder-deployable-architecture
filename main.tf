provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

resource "ibm_cos_bucket" "sample_app_bucket" {
  bucket        = var.bucket_name
  cos_crn       = var.cos_crn
  force_destroy = true
  public        = var.make_public
}

resource "ibm_cos_object" "upload_sample_app" {
  bucket  = ibm_cos_bucket.sample_app_bucket.bucket
  key     = "index.html"
  content = var.sample_app_html
}
