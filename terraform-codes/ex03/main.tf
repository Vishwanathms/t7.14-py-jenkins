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
  count = 2
  vpc_id = aws_vpc.vpc01.id
  cidr_block = var.subnets_cidr[count.index]
  tags = {
    "Name" = "lab-sub${count.index}"
    "Owner" = var.tag_owner
    "Project" = var.tag_project
  }
  lifecycle {
    create_before_destroy = false
    ignore_changes = [ cidr_block  ]
    prevent_destroy = false
  }
}



