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
  ami           = "ami-0739303b376e83e01" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}