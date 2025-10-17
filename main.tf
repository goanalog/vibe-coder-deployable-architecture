terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create COS instance
resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region
}

# Create a COS bucket
resource "ibm_resource_key" "cos_key" {
  name               = "${var.cos_name}-key"
  role               = "Writer"
  source             = ibm_resource_instance.cos_instance.id
  type               = "service_credentials"
}

resource "ibm_cos_bucket_v2" "bucket" {
  name                = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos_instance.id
  location            = var.region
  public_access       = var.make_public
}
