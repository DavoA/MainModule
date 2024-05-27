resource "aws_instance" "in-pub" {
  ami = data.aws_ami.Latest_Ubuntu_22.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name = aws_key_pair.ec2.key_name
  user_data = templatefile("user_data.sh", {
    visibility = "public"
  })
}

resource "aws_instance" "in-private" {
  ami = data.aws_ami.Latest_Ubuntu_22.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name = aws_key_pair.ec2.key_name
  # user_data = file("user_data.sh")
  user_data = templatefile("user_data.sh", {
    visibility = "private"
  })
}