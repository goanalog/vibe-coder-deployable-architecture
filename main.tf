terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.54.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

data "ibm_iam_access_group" "public_access_group" {
  access_group_name = "Public Access"
}

data "ibm_resource_group" "group" {
  is_default = true
}

resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "lite"
  # --- THIS IS THE FIX ---
  location          = "global" 
  # ---------------------
  resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_cos_bucket" "sample" {
  bucket_name          = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.location # This is correct, buckets are regional
}

resource "ibm_iam_access_group_policy" "public_access_policy" {
  count = var.make_public ? 1 : 0 

  access_group_id = data.ibm_iam_access_group.public_access_group.id
  roles           = ["Content Reader"] 

  resources {
    service              = "cloud-object-storage"
    resource_instance_id = ibm_resource_instance.cos.id
    resource_type        = "bucket"
    resource             = ibm_cos_bucket.sample.bucket_name
  }
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn      = ibm_resource_instance.cos.crn
  bucket_location = var.location # This is also correct
  key             = "index.html"
  content         = var.html_content

  depends_on = [
    ibm_iam_access_group_policy.public_access_policy
  ]
}