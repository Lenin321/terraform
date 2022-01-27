provider "aws" {
 
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
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