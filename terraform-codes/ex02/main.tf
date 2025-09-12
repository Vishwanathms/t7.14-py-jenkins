resource "aws_s3_bucket" "bucket1" {
  bucket = "vishwa090925"
  depends_on = [ aws_vpc.vpc01 ]
  tags = {
    "Name" = "lab-s3"
    "Owner" = var.tag_owner
    "Project" = var.tag_project
  }
}

resource "aws_vpc" "vpc01" {
  cidr_block = "192.168.0.0/20"
  tags = {
    "Name" = "lab-vpc"
    "Owner" = var.tag_owner
    "Project" = var.tag_project
  }
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.vpc01.id
  cidr_block = "192.168.1.0/24"
  tags = {
    "Name" = "lab-sub1"
    "Owner" = var.tag_owner
    "Project" = var.tag_project
  }
}


variable "tag_owner" {
  type = string 
  default = "Vishwa"
}

variable "tag_project" {
  type = string
  default = "p1"
}

