terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # Remote state — commented out for now
  # Uncomment when you have an S3 bucket for state
  # backend "s3" {
  #   bucket = "securebank-terraform-state"
  #   key    = "securebank/ecs/terraform.tfstate"
  #   region = "eu-west-2"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "SecureBank"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}