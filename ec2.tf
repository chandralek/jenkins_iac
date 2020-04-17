resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.devops_image.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_jenkins.id]
  tags          = {
    Name        = "jenkins"
  }
}

resource "null_resource" "apply" {
  provisioner "remote-exec" {
    connection {
      host      = aws_instance.jenkins.private_ip
      user      = "root"
      password  = "DevOps321"
      timeout   = "5m"
    }
    inline = [
    "curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/docker-stack/install.sh| bash"]
  }
}