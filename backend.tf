terraform {
  backend "s3" {

      shared_credentials_file = "/home/faheem/.aws/credentials"
      profile = "faheem"

      bucket = "terraform-state-files-ff"
      key = "vpc/terraform.state"
      region = "us-east-1"
      encrypt = true
      dynamodb_table = "terraform-lock"
    }
}