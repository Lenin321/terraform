provider "aws" {
  //region  = "us-east-2"
  //version = "~> 2.46" (No longer necessary)
  region     = "us-east-2"
  access_key = "AKIAVK2WJ7LQDTYB5APH"
  secret_key = "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"
}

resource "aws_instance" "first-ec2" {

  ami                    = "ami-066157edddaec5e49"  
  key_name               = "default1-ec2" 
  instance_type          = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  
}

resource "aws_vpc"  "first-vpc"{

  cidr_block="10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet-1"{
vpc_id=aws_vpc.first-vpc.id
cidr_block="10.0.0.0/24"
  tags = {
    Name = "production-subnet"
  }
}