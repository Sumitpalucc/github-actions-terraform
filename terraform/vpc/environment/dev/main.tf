provider "aws" {
  region = "us-east-1"
}

### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "sumitremotebackend"
    key = "sumitremotebackend.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_iam_user" "sumitpal" {
  name = "iamuser.${count.index}"
  count = 2
  path = "/system/"

}

output "arns" {
  value = aws_iam_user.sumitpal[*].name

}
