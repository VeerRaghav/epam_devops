variable "instance_type" {
  type        = string
  description = "Ec2 Instance Type"
  default     = "t2.micro"
}
variable "tag" {
  type        = string
  description = "The tag to resources"
  default     = "My Web browser"
}
variable "ami" {
  type        = string
  description = "ami of ubuntu"
  default     = "ami-007855ac798b5175e"
}