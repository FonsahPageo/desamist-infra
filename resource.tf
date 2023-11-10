# creating a VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "my_vpc" {
  cidr_block       = "100.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ash-vpc"
  }
}

# creating an internet gateway
resource "aws_internet_gateway" "my_IG" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "ash-IG"
  }
}

# public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "100.0.0.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "ash-pub-SN"
  }
}

# private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "100.0.1.0/24"

  tags = {
    Name = "ash-priv-SN"
  }
}

# public route table
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_IG.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.my_IG.id
  }

  tags = {
    Name = "ash-pub-RT"
  }
}

# private route table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "ash-priv-RT"
  }
}

# route table association
# associate public route table
resource "aws_route_table_association" "pub-route-table-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.pub-route-table.id
}

# associate private route table
resource "aws_route_table_association" "private-route-table-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-route-table.id
}