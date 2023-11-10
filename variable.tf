variable "region" {
  description = "region where our resources will be provisioned"
  default     = "us-east-2"
  type        = string
}

variable "public_sgTAG" {
  description = "public security group"
  default     = "ash-pub-sg"
  type        = string
}

variable "private_sgTAG" {
  description = "private security group"
  default     = "ash-priv-sg"
  type        = string
}

variable "ingress" {
  description = "ingress"
  default     = "22"
  type        = string
}

variable "protocol" {
  description = "protocol"
  default     = "tcp"
  type        = string
}

variable "ami" {
  description = "My golden AMI"
  default     = "ami-011ebac22fcbf137f"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
  type        = string
}

variable "key" {
  description = "instance key pair"
  default     = "Fonsah_key_pair_Ohio"
  type        = string
}

variable "public_ip_association" {
  description = "Assign a public IP to instance"
  default = "true"
  type = string
}

variable "public_instanceTAG" {
  description = "public instance tag"
  default     = "ash-pub "
  type        = string
}

variable "private_instanceTAG" {
  description = "private instance tag"
  default     = "ash-priv"
  type        = string
}