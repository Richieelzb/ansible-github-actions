resource "aws_instance" "ec2-webserver" {
  ami = data.aws_ami.my-amazon-ami.id
  //ami = "ami-0bc691261a82b32bc"
  instance_type = var.instance-type-list[0]
  key_name      = var.key-pair
  // user_data              = file("${path.module}/app-install.sh")
  subnet_id              = module.vpc1.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  #count                  = 3
  tags = {
    Name = "ec2-client-webserver"
  }
}

resource "aws_instance" "ec2-dbserver" {
  ami = data.aws_ami.my-amazon-ami.id
  //ami = "ami-0bc691261a82b32bc"
  instance_type = var.instance-type-list[0]
  key_name      = var.key-pair
  // user_data              = file("${path.module}/app-install.sh")
  subnet_id              = module.vpc1.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  #count                  = 3
  tags = {
    Name = "ec2-client-dbserver"
  }
}