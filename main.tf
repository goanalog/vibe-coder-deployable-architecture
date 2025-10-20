terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.84"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
  required_version = ">= 1.12"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

resource "ibm_resource_instance" "cos_instance" {
  name       = var.cos_name
  service    = "cloud-object-storage"
  plan       = "standard"
  resource_group_id = data.ibm_resource_group.default.id
}

resource "ibm_cos_bucket" "bucket" {
  name          = var.bucket_name
  cos_instance  = ibm_resource_instance.cos_instance.id
  acl           = var.make_public ? "public-read" : "private"
}

resource "local_file" "sample_html" {
  content  = var.sample_app_html
  filename = "${path.module}/tmp_sample_app.html"
}

resource "ibm_cos_object" "sample_app" {
  bucket       = ibm_cos_bucket.bucket.name
  key          = "index.html"
  source       = local_file.sample_html.filename
}
