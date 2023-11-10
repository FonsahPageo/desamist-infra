resource "aws_security_group" "public_sg" {
  name_prefix = "public-"
  vpc_id      = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.public_sgTAG}"
  }
}

resource "aws_security_group" "private_sg" {
  name_prefix = "private-"
  vpc_id      = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.private_sgTAG}"
  }
}

resource "aws_security_group_rule" "public_inbound_http" {
  type              = "ingress"
  from_port         = var.ingress
  to_port           = var.ingress
  protocol          = var.protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "private_inbound_ssh" {
  type              = "ingress"
  from_port         = var.ingress
  to_port           = var.ingress
  protocol          = var.protocol
  cidr_blocks       = ["100.0.1.0/24"] # Allowing SSH only from the public subnet
  security_group_id = aws_security_group.private_sg.id
}

# public instance
resource "aws_instance" "public_Instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = var.public_ip_association
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  tags = {
    Name = "${var.public_instanceTAG}"
  }
}

# private instance
resource "aws_instance" "private_Instance" {
  ami                    = var.ami # Use a valid AMI ID
  instance_type          = var.instance_type
  key_name               = var.key
  subnet_id              = aws_subnet.private-subnet.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  tags = {
    Name = "${var.private_instanceTAG}"
  }
}