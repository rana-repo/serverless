provider "aws" {
  region ="us-east-1"
}	


resource "aws_instance" "ec2-instance-prod1" {
  ami = var.ami
  instance_type = var.instance_type
tags = {
  Name = "lambda-testing1"

 }

}
