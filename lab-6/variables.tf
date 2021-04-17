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
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0ddbdea833a8d2f0d"
    us-east-2 = "ami-0fb1e27304d83032f"
    us-west-1 = "ami-0a309b6bdefdad463"
    us-west-2 = "ami-0554443e7f55d3eeb"
  }
}
