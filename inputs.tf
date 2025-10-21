variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API key. Required for Terraform to create resources."
  sensitive   = true
}

variable "make_public" {
  type        = bool
  description = "Set to true to make the bucket's content publicly accessible via a URL."
  default     = true
}

variable "html_content" {
  type        = string
  description = "Paste your HTML code here to create an instant SPA."
  default     = <<EOT
<!DOCTYPE html>
<html>
<head>
  <title>Vibe Coder SPA</title>
  <style>
    body { font-family: sans-serif; text-align: center; padding: 2em; background: #f4f6f8; }
    h1 { color: #0f62fe; }
    textarea { width: 80%; height: 200px; margin-top: 1em; font-family: monospace; font-size: 14px; }
    button { padding: 0.5em 1em; margin-top: 0.5em; font-size: 14px; }
    #preview { margin-top: 2em; padding: 1em; background: #fff; border: 1px solid #ccc; min-height: 150px; }
  </style>
</head>
<body>
  <h1>Welcome to Vibe Coder!</h1>
  <p>Your instant IBM Cloud SPA is live. Start pasting HTML below to code your vibes!</p>

  <textarea id="editor">
<h1>Editable Vibe!</h1>
<p>Change this text and click 'Update Preview' to see it live.</p>
  </textarea>
  <br>
  <button onclick="updatePreview()">Update Preview</button>

  <div id="preview">
    <h1>Editable Vibe!</h1>
    <p>Change this text and click 'Update Preview' to see it live.</p>
  </div>

  <script>
    function updatePreview() {
      const html = document.getElementById('editor').value;
      document.getElementById('preview').innerHTML = html;
    }
  </script>
</body>
</html>
EOT
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into."
  type        = string
  default     = "Default"
}

variable "bucket_name_prefix" {
  description = "The prefix for the new COS bucket name."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_instance_name" {
  description = "The name for the new COS service instance."
  type        = string
  default     = "vibe-coder-cos"
}

variable "location" {
  description = "The IBM Cloud location to deploy the COS bucket in (e.g., us-south)."
  type        = string
  default     = "us-south"
}
