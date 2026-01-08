resource "aws_instance" "ansible-ec2" {
  ami = data.aws_ami.my-ubuntu-ami.id
  //ami                    = "ami-049442a6cf8319180"
  instance_type          = var.instance-type-list[0]
  key_name               = var.key-pair
  subnet_id              = module.vpc1.public_subnets[0]
  user_data              = file("${path.module}/ansible-install.sh")
  vpc_security_group_ids = [aws_security_group.control-sg.id]
  count                  = 1
  tags = {
    Name = "ansible-controller"
  }
}
