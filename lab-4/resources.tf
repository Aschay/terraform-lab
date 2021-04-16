//get availability datasource from aws 
data "aws_availability_zones" "az" {
}
//get ami info from aws
# data "aws_ami_ids" "ubuntu" {
#   owners = ["099720109477"]

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
#   }
# }
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
//create the instance
resource "aws_instance" "appserver" {
  //ami               = data.aws_ami_ids.ubuntu.id
  ami = data.aws_ami.ubuntu.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.az.names[0]
  tags = {
    Name = "AppServer"
  }
}


