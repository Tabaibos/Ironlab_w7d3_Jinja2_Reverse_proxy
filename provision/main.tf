# main.tf

provider "aws" {
  region = var.region
}

resource "aws_instance" "jinja2-nginxlab" {
  for_each               = toset(var.ec2_names)
  ami                    = var.ami-image
  instance_type          = var.instance_type
  key_name               = var.key_name # defined in tfvars
  vpc_security_group_ids = [aws_security_group.sg_joaquim.id]

  tags = {
    Name = "jinja2-nginxlab-joaquim"
  }

}

resource "aws_security_group" "sg_joaquim" {
  name        = "sg_joaquim"
  description = "Allow SSH access from my IP and allow HTTP from all"

  ingress {
    description = "SSH from my ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.myIP] # defined in tfvars
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_joaquim"
  }
}