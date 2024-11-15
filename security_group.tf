//セキュリティグループの作成
$ git pull origin main
$ git checkout -b feat/security-group

$ touch secutity_group.tf

resource "aws_security_group" "alb" {
    name = "${local.app}-alb"
    description = "For ALB."
    vpc_id = module.vpc.vpc_id 
 ingress {
    description = "Allow HTTP from ALL."
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cider_blocks = ["0.0.0.0/0"]
  }
 egress {
    description = "Allow all to outband."
    from_port = 0
    to_port = 0
    protocol = "-1"
    cider_blocks = ["0.0.0.0/0"]
 }
 tag = {
    Name = "${loocal.app}-alb"

 }
}

resource "aws-security_group" "ecs" {
    name = "${local.app}-ecs"
    description = "For ECS."
    vpc_id = module.vpc.vpc_id
    egress {
        description = "Allow all to outbound."
        from_port = 0
        to_port = 0
        protocol = "-1"
        cider_block = ["0.0.0.0/0"]
    }
    tag = {
        Name = "${local.app}-ecs"
    }
}

resorce "aws-security_group_rule" "ecs_from_alb" {
    description = "Allow 8080 from Security Group for ALB"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = aws_security_group.alb.id 
    source_group_id          = aws_security_group.ecs.id
}

//GitHubにpush
$ git add . && git commit -m "Create Security Group"
$ git push origin feat/security-group

//復習2回目
//セキュリティグループの作成
$ git pull origin main
$ git checkout -b feat/security-group

$ touch security_group.tf

resource "aws_security_group" "alb" {
    name = "${local.app}-alb"
    description = "For ALB."
    vpc_id = module.vpc.vpc_id
    ingress {
        desription = "Allow HTTP from ALL."
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }
    egress {
        desription = "Allow all to outbound."
        from_port = 0
        to_port = 0
        protocol = "-1"
        cider_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${local.app}-ecs"
    }
}

resource "aws_security_group" "ecs" {
    name = "${local.app}-ecs"
    description = "For ECS"
    vpc_id = module.vpc.vpc_id
    egress {
        description = "Allow all to outbound."
        from_port = 0
        to_port = 0
        protocol = "-1"
        cide_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${local,app}-ecs"
    } 
}

resource "aws_security_group_rule" "ecs_from_alb" {
    description = "Allow 8080 from Security Group for ALB. "
    type = "ingress"
    from_port  = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = aws_security_group.alb.id
    security_group_id        = aws_security_group.ecs.id 
}

//GitHubにプッシュ
$ git add . && git commit -m "Create Security Group"
$ git push origin feat/security-gruop 


//復習3回目
//セキュリティグループの作成
$ git pull origin main
$ git checkout -b feat/security-group
$ touch security_group.tf

resource "aws_security_group" "alb" {
    name        = "${local.app}-alb"
    description = "For ALB"
    vpc_id      = module.vpc.vpc_id
    ingress {
        description  = "Allow HTTP form ALL."
        from_port    = 80
        to_port      = 80
        protocol     = "tcp"
        cider_blocks = ["0.0.0.0/0"]
    }
    egress {
        description  = "Allow all to outbound."
        from_port    = 0
        to_port      = 0
        protocol     = "-1"
        cider_blocks = ["0.0.0.0/0"]
    }
    tags = {
       Name = "${local.app}-alb"
    }
}

resource "aws_security_group" "ecs" {
           name = "${local.app}-ecs"
    description = "For ECS"
    vpc_id      = module.vpc.vpc_id
    egress {
        description = "Allow all to outbound. "
        from_port   = 0
        to_port     = 0
       protocol     = "-1"
       cidr_blocks  =["0.0.0.0/0"]
    }
    tags = {
        Name = "${local.app}-ecs"
    }
}

resource "aws_security_group_rule" "ecs_from_alb" {
    description             = "Allow 8080 from Security Group for ALB."
    type                    = "ingress"
   from_port                = 8080
   to_port                  = 8080
   source_security_group_id = aws_security_group.alb.id
   security_group_id        = aws_security_group.ecs.id
} 

//GitHubにプッシュ
$ git add. && git commit -m "Create Security Group"
$ git push origin feat/securuty-group
