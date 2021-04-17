//create the instance
resource "aws_instance" "appserver" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  tags = {
    Name = "AppServer"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.appserver.private_ip} >> info.txt"
  }
}
output "public_ip" {
  value = aws_instance.appserver.public_ip
}



