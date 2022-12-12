#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

#variable block
variable "instance_type" {
  type = string

}

#output block
output "public_ip" {
  value = aws_instance.my_server.public_ip
}

#resource block
resource "aws_instance" "my_server" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = var.instance_type
}
