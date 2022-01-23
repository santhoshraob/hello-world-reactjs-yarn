terraform {
  backend "s3" {
    bucket = "octopus-tf-state"
    key    = "stage/octopus-stage.tfstate"
    region = "eu-west-2"
  }
}