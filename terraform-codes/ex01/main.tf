provider "aws" {
  region     = "us-east-1"
  profile = "default"
  #access_key = "accesskey"
  #secret_key = "secretkey"
}

resource "aws_instance" "example" {
  ami = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
}
