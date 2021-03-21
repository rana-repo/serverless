provider "aws" {
  region ="us-east-1"
  access_key = "AKIAZ7I6QMFSS3J6CP4R"
  secret_key = "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"
}

resource "aws_instance" "ec2-instance-prod" {
  ami = var.ami
  instance_type = var.instance_type
tags = {
  Name = "lambda-testing"

 }

}