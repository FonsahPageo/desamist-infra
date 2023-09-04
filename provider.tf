terraform {
  backend "s3" {
    bucket = "ashprincebackend"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate" # path in s3 busket to store the file
    region = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
  }
}

provider "aws" {
  region = var.region
}
