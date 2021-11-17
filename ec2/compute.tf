resource "aws_key_pair" "wakau_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "jump_server" {
  instance_type = var.instance_type
  ami           = data.aws_ami.amazon-linux-2.id
  tags = {
    Name = "Demo"
  }
  key_name               = aws_key_pair.wakau_key.id
  vpc_security_group_ids = [aws_security_group.jump_security_group.id]
  subnet_id              = aws_subnet.reserved[0].id
  #private_ip             = 
  user_data              = file("createUserAll.sh")
}

resource "aws_launch_template" "jump" {
  name                   = "demo"
  description            = "demo"
  image_id               = data.aws_ami.amazon-linux-2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jump_security_group.id]
  key_name               = var.key_name
}

resource "aws_autoscaling_group" "jump" {
  name             = "jump"
  max_size         = 1
  min_size         = 1
  desired_capacity = 1
  #availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_zone_identifier = [aws_subnet.reserved[0].id, aws_subnet.reserved[1].id, aws_subnet.reserved[2].id]
  launch_template {
    id      = aws_launch_template.jump.id
    version = "$Latest"
  }
}