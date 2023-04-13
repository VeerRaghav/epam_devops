provider "aws" {
    region = "us-east-1"
}
resource "aws_vpc" "dvpc" {
    cidr_block = "10.10.0.0/16"
}
resource "aws_subnet" "az1" {
  count=3
  cidr_block = var.cidrs[count.index]
  availability_zone = var.azs[count.index]
  vpc_id = aws_vpc.dvpc.id
}
resource "aws_security_group" "sg1alb" {
  vpc_id = aws_vpc.dvpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb" "alb" {
  name = "terra-alb-11914558"
  subnets = [
    aws_subnet.az1[0].id,aws_subnet.az1[1].id,aws_subnet.az1[2].id,
  ]
  security_groups = [
    aws_security_group.sg1alb.id,
  ]

}
resource "aws_lb_target_group" "albtg" {
  name = "sai-terrae-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.dvpc.id
}
resource "aws_instance" "saiic" {
  ami = "ami-0cbe3e3c3e654abea"  
  instance_type = "t2.micro"
  subnet_id = aws_subnet.az1[0].id
  tags = {
    Name = "11914558-ec2-instance"
  }
}
resource "aws_lb_target_group_attachment" "tg" {
  target_group_arn = aws_lb_target_group.albtg.arn
  target_id = aws_instance.saiic.id
  port = 80
}


