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

resource "aws_iam_user" "user" {
  name = "Test-user"
  path = "/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "user_ro" {
  name = "test"
  user = aws_iam_user.user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
