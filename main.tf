provider "aws" {
    region = var.aws_region
    shared_credentials_file = "/home/faheem/.aws/credentials"
    profile = "faheem"
}