resource "aws_instance" "ansible-ec2" {
  ami = data.aws_ami.my-data-ami.id
  //ami = "ami-0bc691261a82b32bc"
  instance_type = var.instance-type-list[0]
  key_name      = var.key-pair
  subnet_id     = module.vpc1.public_subnets[0]
  user_data              = file("${path.module}/app-install.sh") 
  vpc_security_group_ids = [aws_security_group.public-sg-vpc1.id]
  count                  = 1
  tags = {
    Name = "ansible-controller"
  }
}
