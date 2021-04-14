terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 3.27"
  }
}
provider "aws" {
  profile    = "default"
  access_key = "YOURACCESSKEYHERE"
  secret_key = "YOURSECRETKEYHERE"
  region     = "us-east-2" //cheapest next us-east-1
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = {
    Name = "FirstAppSever"
  }
}