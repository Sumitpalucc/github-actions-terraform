provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Testremotestate"
  }
}

terraform {
  backend "s3" {
    bucket = "myrestatebucket"
    key    = "path/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraformstate"
  }
}
