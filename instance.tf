resource "aws_key_pair" "init-key" {
    key_name = "initkey"
    public_key = file(var.PUB_KEY)
}

resource "aws_instance" "init-web" {
  ami = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.init-pub-1.id
  key_name = aws_key_pair.init-key.key_name
  vpc_security_group_ids = [aws_security_group.init_stack_sg.id]
  tags = {
    Name = "my-init-instance"
  }
}

resource "aws_ebs_volume" "vol_4_init" {
  # our subnet is being created in zone 1
  # so ebs volume should also be in same zone
  availability_zone = var.ZONE1
  size = 3 # 3 gb
  tags = {
    Name = "extr-vol-4-init"
  }
}

# attach the volume to an instance
resource "aws_volume_attachment" "atch_vol_init" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.vol_4_init.id
  instance_id = aws_instance.init-web.id
}

output "PublicIP" {
  value = aws_instance.init-web.public_ip
}