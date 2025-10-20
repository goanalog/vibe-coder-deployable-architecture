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

# We need this to create the IAM policy
data "ibm_iam_access_group" "public_access_group" {
  name = "Public Access"
}

data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = var.location
  resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_cos_bucket" "sample" {
  bucket_name          = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  # --- FIX 2: REMOVED force_destroy and public_access ---
  # These arguments are not valid for ibm_cos_bucket
}

resource "ibm_iam_access_group_policy" "public_access_policy" {
  count = var.make_public ? 1 : 0 # Conditionally create this policy

  access_group_id = data.ibm_iam_access_group.public_access_group.id
  roles           = ["Content Reader"] # Role for public web hosting

  resources {
    service              = "cloud-object-storage"
    resource_instance_id = ibm_resource_instance.cos.id
    resource_type        = "bucket"
    resource             = ibm_cos_bucket.sample.bucket_name
  }
}

resource "ibm_cos_bucket_object" "html_spa" {
  # Argument 'bucket' is the name, not the resource ID
  bucket       = ibm_cos_bucket.sample.bucket_name
  key          = "index.html"
  content      = var.html_content
  content_type = "text/html"

  # Ensures the bucket is public before trying to upload
  depends_on = [
    ibm_iam_access_group_policy.public_access_policy
  ]
}