resource "aws_s3_bucket" "bucket-dev4" {
  bucket = "bck-dev4"
  acl    = "private"

  tags = {
    Name = "bck-dev4"
  }
}