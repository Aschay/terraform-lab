//copy the public key from host to remote 
resource "aws_key_pair" "aws_pk" {
  key_name   = "aws_pk"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
//create the instance
resource "aws_instance" "appserver" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_pk.key_name
  tags = {
    Name = "AppServer"
  }
  //establish ssh connection between host and aws_instance 
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  //upload the script 
  provisioner "file" {
    source      = "setup-nginx.sh"
    destination = "/tmp/setup-nginx.sh"

  }
  //execute the script 
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup-nginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/setup-nginx.sh",
      "sudo /tmp/installNginx.sh",
    ]
  }
}


