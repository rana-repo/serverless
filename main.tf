provider "aws" {
  region ="us-east-1"
  access_key = "AKIAYC4YQTPI4XUH2GGJ"
  secret_key = "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"
}	


resource "aws_instance" "ec2-instance-prod1" {
  ami = var.ami
  instance_type = var.instance_type
tags = {
  Name = "lambda-testing1"

 }

}