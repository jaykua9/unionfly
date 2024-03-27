provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

terraform {
  backend "s3" {
    bucket         = "unionfly-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "unionfly-dynamodb-lock"
  }
}
