resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket1234532"
  acl    = "private"

  tags = {
    Name        = "mybucket"    
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.b.id

  block_public_acls   = true
  ignore_public_acls      = true
  block_public_policy = true
  restrict_public_buckets = true

}

