# create backend bucket into which we will store our state file

resource "aws_s3_bucket" "backend-bucket" {
  bucket = "ashprincebackend"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend-bucket-encryption" {
  bucket = aws_s3_bucket.backend-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "my-kms-key-id"
      sse_algorithm     = "aws:kms"
    }
  }
}

# creating dynamodb table to lock the state file
resource "aws_dynamodb_table" "statelock" {
  name         = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
