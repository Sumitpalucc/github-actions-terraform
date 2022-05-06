provider "aws" {
  region = "us-east-1"
}

### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "cloudgeeks-backend1"
    key = "cloudgeeks.tfstate"
    region = "us-east-1"
  }
}

resource "aws_iam_user" "sumit" {
  name = "iamuser.${count.index}"
  count = 2
  path = "/system/"

}

output "arns" {
  value = aws_iam_user.sumitpal[*].name

}
