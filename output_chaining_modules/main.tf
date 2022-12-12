#terraform block
terraform {
}

#module block, references the aws_server folder and the information there
module "aws_server"{
   source = ".//aws_server" 
   instance_type = "t2.micro"
}

#output block
output "public_ip" {
  value = module.aws_server.public_ip
  sensitive = false
}

