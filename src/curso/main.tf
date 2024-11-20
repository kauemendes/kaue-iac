terraform {         
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  backend "s3" {
    bucket         = "kauecode-state"
    key            = "stage/kauecode-app/curso.tfstate"
    region         = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      owner = "Kaue"
      environment = "Test"
      managed-by = "terraform"
    }
  }
}