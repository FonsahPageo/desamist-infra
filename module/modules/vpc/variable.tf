variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
}

variable "tenancy" {
    default = "dedicated"
    type = string
}

variable "vpc_tag" {
    default = "ash-vpc"
    type = string
}

variable "vpc_id" {
}

variable "subnet_cidr" {
    default = "10.0.0.0/24"
    type = string
}

variable "subnet_tag" {
    default = "ash-sub"
    type = string
}