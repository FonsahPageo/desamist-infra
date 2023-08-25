# create backend bucket into which we will store our state file

resource "aws_s3_bucket" "ashprince101" {
  bucket = "ashprincebackend"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  } 
}

# creating dynamodb table to lock the state file
resource "aws_dynamodb_table" "statelock" {
  name = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID" 

  attribute {
    name = "LockID"
    type = "S"
  }
}