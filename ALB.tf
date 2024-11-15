//TerraformでALBの作成
$ git pull origin main
$ git checkout -b feat/alb
$ touch alb.tf

resource "aws_lb" "alb" {
    name                = "${local.app}-alb"
    local_balancer_type = "application"
    security_groups     = [aws_security_group.alb.id]
    subnets             = module.vpc.public_subnets
}

resource "aws_alb_listener""alb_listener" {
    load_balancer_arn = aws_lb.alb.arn
    port              = "80"
    protocol          = "HTTP"


 default_action {
    type              ="fixed-responce"


   fixed_response {
    content_type      = "text/plain"
    message_body      = "fixed response content"
    status_code       = "200"
   }

 }
}

resource "aws_lb_listener_rule" "alb_listener_rule" {
    listener_arn = aws_lb_listener.alb_listener.arn

    action {
        type          = "forward"
    target_group_arn  = aws_lb_target_gruop.target_group.arn 
    }

    condition {
        path_pattern  = {
            values    = ["*"]
        } 
    }
} 


resource "aws_alb_target_group" "target_group" {
    name               = "${local.app}-target-group"
    port               = 8080
    protocol           = "HTTP"
    target_type        = "ip"
    vpc_id             = module.vpc.vpc_id 


    health_check {
        healty_threshold = 3
        interval         = 30t
        path             = "/health_checks"
        protocol         = "HTTP"
        timeout          = 5
    }
}

//GitHubにプッシュ
$ git add . && git commit -m "Create Application Load Balancer"
$ git push origin feat/alb

//復習2回目　
//TerraformでALBの作成
$ git pull origin main 
$ git checkout -b feat/alb
$ touch alb.tf

resource "aws_alb" "alb" {
    name                 = "${local.app}-alb"
    load_balancer_type   = "application"
    security_groups      = [aws_security_group.alb.id]
    subnets              = module.vpc.public_subnets 
}

resource "aws_lb_listener" "alb_listener" {
   load_balancer_arn     = aws_lb.alb.arn
   port                  = "80"
   protocol              = "HTTP"
 
   default_action {
    type                 = "fixed-response"

    fixed_response {
        content_type     = "text/plain"
        message_body     = "Fixed response content"
        status_code      = "200"
     }
   }
}

resource "aws_lb_listener_rule" "alb_listener_rule" {
  listener_arn           = aws_lb_listener.alb_listener.arn

  action {
    type                 = "forward"
    target_group_arn     = aws_lb_target_group.target_group.arn
  
  }

  condition {
    path_pattern {
        values           = ["*"]
    }
  }
}

resource "aws_lb_target_group" "target_group" {
    name                = "${local.app}-target-group"
    port                = 8080
    protocol            = "HTTP"
    target_type         = "ip"
    vpc_id              = module.vpc.vpc_id  
 health_check {
    health_threshold    = 3
    interval            = 30
    path                = "/health_checks"
    protocol            = "HTTP"
    timeout             = 5
 }

}

//GitHubにコミット
$ git add . && git commit -m "Create Applicaton Load Balancer"
$ git push origin feat/alb 

//復習3回目
//TerraformでALBの作成
$ git pull origin main
$ git checkout -b feat/alb
$ touch alb.tf

resource "aws_lb" "alb" {
    name           ="${local.app}-alb"
    load_balancer  = "application"
    security_group = [aws_security_group.alb.id]
    subnets        = module.vpc.public_subnets
}
resource "aws_lb_listner" "alb_listner" {
    load_balancer = aws_lb.alb.arn
    port          = "80"
    protocol      = "HTTP"
 
  default_action {
    type = "fixed-responce"
  

   fixed_responce {
    context_type = "text/plain"
    message_body = "Fixed response content"
    status_code  = "200"
   }
 }
} 

resource "aws_lb_listener_rule" "alb_listener_rule" {
  listener_arn = aws_lb_listner.alb_listener.arn

  action  {
    type         = "forward"
    target_group = aws_lb_target_group.target_group.arn
  }

  condition {
    path_pattern {
        values = ["*"]
    }
  }
}

resource "aws_lb_target_group" "target_group" {
    name     = "{local.app}-target-group"
    port     = 8080
    protocol = "HTTP"
    target_type = "ip"
    vpc_id   = module.vpc.vpc_id

health_check {
    healthy_threshold = 3
    interval          = 30
    path              = "/health_checks"
    protocol          = "HTTP"
    timeout           = 5
}

}


//GitHubにコミット
$ git add . && git commit -m "Create Application Load Balancer"
$ git push origin feat/alb

