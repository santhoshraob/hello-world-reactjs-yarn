terraform {
  backend "s3" {
    bucket = "octopus-tf-state"
    key    = "development/octopus-dev.tfstate"
    region = "eu-west-2"
  }
}