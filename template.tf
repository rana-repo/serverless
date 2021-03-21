# Archive a single file.

data "archive_file" "init" {
  type        = "zip"
  source_file = "zip/volume_snap.py"
  output_path = "volume_snap.zip"
}



