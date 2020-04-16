terraform {
  backend "s3" {
    bucket = "tfstaterobo"
    key    = "jenkins/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-locking"
  }
}
