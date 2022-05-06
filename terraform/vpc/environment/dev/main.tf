provider "aws" {
  region = "ap-south-1"
}

### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "myrestatebucket1"
    key = "myrestatebucket1.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_iam_user" "sumit123" {
  name = "iamuser.${count.index}"
  count = 2
  path = "/system/"

}

output "arns" {
  value = aws_iam_user.sumitpal123[*].name

}
