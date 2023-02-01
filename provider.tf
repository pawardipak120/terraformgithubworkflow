terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "sf-terraform-artifacts"
    key    = "gitworkflow/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = var.aws_region #"ap-southeast-2"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env}-tfworkflowpoc"
  tags = {
    Name        =  "${var.env}-tfworkflowpoc"
    Environment = var.env
  }
}

