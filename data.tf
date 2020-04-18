data "aws_ami" "devops_image" {
  most_recent      = true
  name_regex       = "Centos-7-DevOps-Practice"
  owners           = ["973714476881"]
}

data "aws_ebs_volume" "jenkins-volume" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp2"]
  }

  filter {
    name   = "tag:Name"
    values = ["jenkins-volume"]
  }
}