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
  description = "The size of the instance"
  #sensitive = true #obscures the value after "Terraform plan"
  validation {
    condition = can(regex("^t2.",var.instance_type))
    error_message = "The instance must be a t2 type instance."
  }

}

#output block
output "public_ip" {
  value = aws_instance.my_server.public_ip
  #sensitive = true
}

#resource block
resource "aws_instance" "my_server" {
  ami           = local.ami
  instance_type = local.instance_type
}

locals {
  ami = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
}
