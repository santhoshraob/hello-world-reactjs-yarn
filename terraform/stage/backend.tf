terraform {
  backend "s3" {
    bucket = "octopus-tf-state"
    key    = "development/octopus-stage.tfstate"
    region = "eu-west-2"
  }
}