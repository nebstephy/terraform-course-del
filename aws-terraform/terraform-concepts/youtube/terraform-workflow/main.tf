terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami                    = "ami-09040d770ffe2224f"
  instance_type          = "t2.micro"
  key_name               = "ansible-key"
  vpc_security_group_ids = ["sg-0c3533ef29dec291d", "sg-06e6f7b94a896c483"]
  subnet_id              = "subnet-000d5ee9d01bddbb2"
  root_block_device {
    volume_size = "10"
  }
  tags = {
    Name      = "vm"
    Create_By = "Terraform"
  }
}
