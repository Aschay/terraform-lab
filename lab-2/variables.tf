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
  validation {
    condition     = contains(["us-east-1", "us-east-2"], var.AWS_REGION)
    error_message = "Unsupported Azure Region specified. Supported regions include: us-east-1, us-east2."
  }

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

variable "base_cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default     = "10.1.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type        = list(string)
  default     = ["us-east-2a"]
}
