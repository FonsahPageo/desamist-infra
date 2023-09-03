variable "ec2_count" {
    default = "1"
}

variable "ami_id" {
    default = "ami-0882464c8b804e526"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "subnet_id" {
}

variable "instance_tag" {
    default = "ash-instance"
}