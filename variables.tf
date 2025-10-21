# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Vibe Code Landing Zone — Variables
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

variable "resource_group" {
  description = "Where your vibe lives organizationally. If unsure, 'default' is fine."
  type        = string
  default     = "default"
}

variable "region" {
  description = "IBM Cloud region for your Object Storage bucket. 'us-south' is a steady classic."
  type        = string
  default     = "us-south"
}

variable "cos_instance_name" {
  description = "A friendly name for your IBM Cloud Object Storage instance."
  type        = string
  default     = "vibe-instance-123456"
}

variable "bucket_name" {
  description = "Your public bucket name (lowercase, no spaces). This becomes your vibe’s home in the cloud."
  type        = string
  default     = "vibe-bucket-123456"
}

variable "index_html" {
  description = "Paste your full HTML here — it becomes your app’s index.html when deployed."
  type        = string
  default     = ""
}

variable "index_html_file" {
  description = "Optional path to a local HTML file (e.g., index.html). Used only if the textarea above is empty."
  type        = string
  default     = ""
}
