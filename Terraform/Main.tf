provider "aws" {
  region = "us-east-1"
}
/*
resource "aws_instance" "demo1" {
  instance_type = var.instance_type
  ami           = var.ami
  tags = {
    "Name" = var.tag
  }
}*/
resource "aws_s3_bucket" "demo2" {
  bucket = "my-terra-sai"
  tags = {
    "Name" = "my-buck-demo-terra-sai"
  }
}
