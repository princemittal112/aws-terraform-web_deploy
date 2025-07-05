terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-prince"
    key            = "ec2/nginx-instance.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table-prince"
  }
}

