variable "cos_bucket_name" {
  type        = string
  default     = "vibe-coder-sample-bucket"
  description = "Name your free vibe code bucket—smart default lets you launch instantly."
}

variable "cos_region" {
  type        = string
  default     = "us-south"
  description = "Cloud region for your bucket. Default is fast and reliable."
}

variable "cos_resource_group" {
  type        = string
  default     = "default"
  description = "Resource group for your bucket. Default is 'default' for quick setup."
}

variable "index_html_path" {
  type        = string
  default     = "sample-index.html"
  description = "Path to your sample app's index.html file. Starter app is default, pasting your own code replaces it."
}

variable "public_access" {
  type        = bool
  default     = true
  description = "Make your app public? Default is true for instant sharing."
}

variable "vibe_code" {
  type        = string
  default     = "<h1>Hello, Vibe World!</h1>"
  description = "Paste your HTML here. Default is starter app, but your code will overwrite it—your vibes, your rules!"
}
