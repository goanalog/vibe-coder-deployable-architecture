locals {
  use_local_file  = trim(var.local_app_path) != ""
  use_pasted_app  = !local.use_local_file && trim(var.pasted_app_code) != ""
  default_app_raw = file("${path.module}/defaults/default-vibe-app.html")

  # select source in order: local file -> pasted -> default
  app_source = local.use_local_file ? file(var.local_app_path) :
               local.use_pasted_app ? var.pasted_app_code :
               local.default_app_raw
}
