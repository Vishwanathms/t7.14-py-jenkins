variable "tag_owner" {
  type = string 
  default = "Vishwa"
}

variable "tag_project" {
  type = string
  default = "p1"
}

variable "subnets_cidr" {
  type = list 
  default = ["192.168.1.0/24", "192.168.2.0/24"]
}