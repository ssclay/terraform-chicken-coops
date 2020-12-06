#Create the Elastic Load Balancer to point the outside 
#to the private webserver
resource "aws_lb" "ELB" {
  name               = "ElasticLoadBalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ELBSG.id]
  subnets            = [aws_subnet.PublicA.id, aws_subnet.PublicB.id]
}

#Add Listeners to ELB
resource "aws_lb_listener" "LBEAR" {
  load_balancer_arn = aws_lb.ELB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.WebServers.arn
  }

}

#Add Target Groups to ELB
resource "aws_lb_target_group" "WebServers" {
  name        = "WebServer-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Hutch1.id
}
