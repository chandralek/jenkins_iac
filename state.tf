terraform {
  backend "s3" {
    bucket = "jenkinsbucket2"
    key    = "jenkins/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-locking"
  }
}
