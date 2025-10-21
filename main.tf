terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.60" 
    }
  }
}

locals {
  [cite_start]spa_content = var.pasted_code [cite: 1]
}

[cite_start]resource "ibm_cos_bucket" "vibe_spa_bucket" { [cite: 1]
  [cite_start]bucket               = var.cos_bucket_name [cite: 1]
  [cite_start]resource_instance_id = var.cos_instance_id [cite: 1]
  [cite_start]location             = var.cos_bucket_location [cite: 1]
}

resource "ibm_cos_bucket_object" "vibe_index" {
  [cite_start]bucket_location = ibm_cos_bucket.vibe_spa_bucket.location [cite: 1]
  [cite_start]bucket          = ibm_cos_bucket.vibe_spa_bucket.bucket [cite: 1]
  [cite_start]key             = "index.html" [cite: 1]
  [cite_start]content         = local.spa_content [cite: 1, 2]
}

output "spa_url" {
  [cite_start]value       = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html" [cite: 1]
  [cite_start]description = "Key URL to access your deployed SPA" [cite: 1]
}