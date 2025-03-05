resource "aws_s3_bucket" "state" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "state_policy" {
  bucket = aws_s3_bucket.state.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Deny"
      Principal = "*"
      Action   = "s3:*"
      Resource = "${aws_s3_bucket.state.arn}/*"
      Condition = {
        Bool = { "aws:SecureTransport" = "false" }
      }
    }]
  })
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
