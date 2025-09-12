terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.5.0"
}


terraform {
  backend "s3" {
    # Required
    bucket         = "vishwa250805"      # S3 bucket name
    key            = "env/dev/terraform.tfstate" # Path within the bucket
    region         = "us-east-2"               # AWS region of the bucket 
    profile        = "default"    
    encrypt        = true   
    
    dynamodb_table = "terraform-locks"
  }
}