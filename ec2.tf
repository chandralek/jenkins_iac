resource "aws_instance" "jenkins" {
  ami           = ""
  instance_type = ""
  tags          = {
    Name        = "jenkins"
  }
}