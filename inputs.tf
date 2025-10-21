variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API Key"
}

variable "location" {
  type        = string
  default     = "us-south"
  description = "IBM Cloud location for the COS bucket"
}

variable "make_public" {
  type        = bool
  default     = true
  description = "Make the SPA publicly accessible"
}

variable "vibe_code" {
  type        = string
  default     = <<EOF
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
  <textarea id="editor"><h1>Editable Vibe!</h1>
<p>See it live.</p></textarea>
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
EOF
  description = "Default Vibe Code HTML"
}
