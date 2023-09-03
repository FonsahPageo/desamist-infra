resource "aws_instance" "main" {
    count = "${var.ec2_count}" #how many instances we want to spin up
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"

  tags = {
    Name = "${var.instance_tag}"
  }
}