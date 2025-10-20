terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = "~> 1.84"
    }
  }
  required_version = ">= 1.12"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# IBM Cloud Object Storage Instance
resource "ibm_resource_instance" "cos" {
  name        = var.cos_name
  service     = "cloud-object-storage"
  plan        = var.cos_plan
  resource_group = var.resource_group
  location    = var.region
}

# IBM Cloud Object Storage Bucket
resource "ibm_cos_bucket" "sample" {
  bucket      = var.bucket_name
  instance_id = ibm_resource_instance.cos.id
  force_destroy = true
  public_access = var.make_public ? "true" : "false"
}
