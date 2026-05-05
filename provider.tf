terraform {
    required_providers {
        aws = { 
            source = "hashicorp/aws" 
            version = "6.36.0"
        }
    } 
backend "s3" {
    bucket = "terraform-state-ismail-1"
    key    = "terraform.tfstate" 
    region = "eu-west-1"
}

}

provider "aws" {
    region = "eu-west-1"
     # Configuration options
      }