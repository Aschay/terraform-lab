//get availability datasource from aws 
# data "aws_availability_zones" "az" {
# }
//get ami info from aws
# data "aws_ami_ids" "ubuntu" {
#   owners = ["099720109477"]
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
#   }
# }
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"]
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }
//get the ip ranges from aws datasource
data "aws_ip_ranges" "us_east_ip_range" {
  regions  = ["us-east-1", "us-east-2"]
  services = ["ec2"]
}
//create new sg 
resource "aws_security_group" "sg-custom" {
  name = "custom_us_east"

  ingress {
    from_port = "443"
    to_port   = "443"
    protocol  = "tcp"
    //cidr_blocks = slice(data.aws_ip_ranges.us_east_ip_range.cidr_blocks, 0, 50)
    cidr_blocks = data.aws_ip_ranges.us_east_ip_range.cidr_blocks
  }

  tags = {
    CreationDate = data.aws_ip_ranges.us_east_ip_range.create_date
    SyncToken    = data.aws_ip_ranges.us_east_ip_range.sync_token
  }
}
//create the instance
resource "aws_instance" "appserver" {
  ami = "ami-0fb1e27304d83032f"
  //ami               = data.aws_ami_ids.ubuntu.id
  //ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  //availability_zone = data.aws_availability_zones.az.names[0]
  tags = {
    Name = "AppServer"
  }
}

