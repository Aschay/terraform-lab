variable "AWS_ACCESS_KEY" {
  description = "AWS access key "
  type        = string
  sensitive   = true
}
variable "AWS_SECRET_KEY" {
  description = "AWS secret key "
  type        = string
  sensitive   = true
}
variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"


}
variable "Security_Group" {
  type    = list(any)
  default = ["sg-24076", "sg-90890", "sg-456789"]
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0f40c8f97004632f9"
    us-east-2 = "ami-05692172625678b4e"
    us-west-2 = "ami-0352d5a37fb4f603f"
    us-west-1 = "ami-0f40c8f97004632f9"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "aws_pk"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "aws_pk.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}