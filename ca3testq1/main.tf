provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "sg1alb" {
  vpc_id = "vpc-053f6f4786563b0f2"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb" "alb" {
  name = "alb-11914558"
  subnets = ["subnet-06c2fa1fd4ef2c35f","subnet-03e6da4dd2e97ed48"
  ]
  security_groups = [
    aws_security_group.sg1alb.id,
  ]

}
resource "aws_lb_target_group" "albtg" {
  name = "sai-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = "vpc-053f6f4786563b0f2"
}
resource "aws_instance" "saic" {
  ami = "ami-02396cdd13e9a1257"  
  instance_type = "t2.micro"
  subnet_id = "subnet-06c2fa1fd4ef2c35f" 
  tags = {
    Name = "11914558-ec2-instance"
  }
}
resource "aws_lb_target_group_attachment" "tg" {
  target_group_arn = aws_lb_target_group.albtg.arn
  target_id = aws_instance.saic.id
  port = 80
}


