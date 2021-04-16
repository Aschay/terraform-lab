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
