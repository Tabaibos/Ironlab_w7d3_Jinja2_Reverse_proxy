# variables.tf

variable "region" {
  description = "The AWS region to deploy in."
  default     = "us-east-1"
}

variable "ec2_names" {
  description = "Ec2 names"
  type        = list(string)
  default     = ["reverse-proxy", "upstream-server"]

}
variable "instance_type" {
  description = "EC2 instance type."
  default     = "t3.micro"
}

variable "ami-image" {
  type    = string
  default = "ami-091138d0f0d41ff90"
}

variable "myIP" {
  description = "my ip for sh connection"
  type        = string
}

variable "key_name" {
  description = "key for ssh connection"
  type        = string
}