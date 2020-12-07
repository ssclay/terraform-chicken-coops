#Create the Elastic Load Balancer to point the outside 
#to the private webserver
resource "aws_lb" "ELB" {
  name               = "ELB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ELBSG.id]
  subnets            = [aws_subnet.PublicA.id, aws_subnet.PublicB.id]
}

#Add Listeners to ELB
resource "aws_lb_listener" "Listener" {
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
  name        = "WebServers"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.myvpc.id

}
