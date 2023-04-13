//default workspace for terraform is default
//workspaces allows us to create multiple environments
//terraform workspace list ---> will display current workspaces 
provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "buck1" {
  bucket = terraform.workspace == "production" ? "my-terra-prod" : terraform.workspace=="staging" ? "my-terra-stage-sai" : "my-terra-devlopment-sai"
  tags = {
    "Name" = "Terra1"
  }
}