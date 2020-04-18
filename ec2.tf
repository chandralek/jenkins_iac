resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.devops_image.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_jenkins.id]
  tags          = {
    Name        = "jenkins"
  }
}

resource "null_resource" "apply" {
  connection {
    host      = aws_instance.jenkins.private_ip
    user      = "root"
    password  = "DevOps321"
    timeout   = "5m"
  }
  provisioner "file" {
    source = "scripts/install-jenkins.sh"
    destination = "/tmp/install-jenkins.sh"
  }

  provisioner "file" {
    source = "scripts/admin-create.groovy"
    destination = "/tmp/admin-create.groovy"
  }

  provisioner "remote-exec" {

    inline = [
    "sh /tmp/install-jenkins.sh"
    ]
  }
}