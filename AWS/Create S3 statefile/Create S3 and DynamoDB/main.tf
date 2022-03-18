terraform {
  # 1. COMMENT LINES 8-14 ABD RUN TERRAFORM APPLY (CREATE LOCAL BACKEND)
  # 2. UNCOMMENT THIS CODE AND RERUN TERRAFORM INIT, PLAN AND APPLY TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  backend "s3" {
    bucket         = "techbrain-terraformcode"
    key            = "statefile/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
  # COMMENT TILL THIS LINE

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

# S3

resource "aws_s3_bucket" "terraform_state" {
  bucket = "techbrain-terraformcode"
}

resource "aws_s3_bucket_acl" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# DYNAMODB TABLE

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-state-locking-dynamodb-table-1"
    Environment = "sandbox"
  }
}