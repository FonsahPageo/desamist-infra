variable "region" {
  description = "region where our resources will be provisioned"
  default = "us-east-1"
  type = string
}

variable "public_sgTAG" {
  description = "public security group"
  default = "ashprince-public-sg"
  type = string
}

variable "private_sgTAG" {
  description = "private security group"
  default = "ashprince-private-sg"
  type = string
}

variable "ingress" {
  description = "ingress"
  default = "22"
  type = string
}

variable "protocol" {
  description = "protocol"
  default = "tcp"
  type = string
}

variable "ami" {
  description = "our AMI"
  default = "ami-053b0d53c279acc90"
  type = string
}

variable "instance_type" {
  description = "instance type"
  default = "t2.micro"
  type = string
}

variable "key" {
  description = "instance key pair"
  default = "Fonsah_key_pair"
  type = string
}

variable "public_ip_association" {
  description = "instance type"
  default = "true"
  type = string
}

variable "public_instanceTAG" {
  description = "public instance tag"
  default = "ashprince_prod_public "
  type = string
}

variable "private_instanceTAG" {
  description = "privte instance tag"
  default = "ashprince_prod_private "
  type = string
}