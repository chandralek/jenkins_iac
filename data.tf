data "aws_ami" "devops_image" {
  most_recent      = true
  name_regex       = "Centos-7-DevOps-Practice"
  owners           = ["973714476881"]
}