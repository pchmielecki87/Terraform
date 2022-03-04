terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-0c6ebbd55ab05f070" # Ubuntu 20.04 LTS // eu-west-3 (Paris)
  instance_type = "t2.micro"
}