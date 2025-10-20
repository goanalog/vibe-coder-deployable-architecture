terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.54.0"
    }
  }
}

resource "ibm_resource_instance" "cos" {
  name     = var.cos_instance_name
  service  = "cloud-object-storage"
  plan     = "standard"
  # You will likely need to add location and resource_group_id
  # location = var.resource_group_location 
  # resource_group = data.ibm_resource_group.group.id 
}

resource "ibm_cos_bucket" "sample" {
  name                 = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  force_destroy        = true
  public_access        = var.make_public
}

resource "ibm_cos_object" "html_spa" {
  bucket       = ibm_cos_bucket.sample.name
  key          = "index.html"
  content      = var.html_content
  content_type = "text/html"
}