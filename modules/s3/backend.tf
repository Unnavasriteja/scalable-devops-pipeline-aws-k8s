terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-prod"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
