//iam.tfの作成　
$ touch iam.tf


//IAMの作成
date "aws_iam_policy_document" "ecs_task_assume" {
   statement {
    actions = ["sts.AssumeRole"]
    Principals {
       type = "Service"
       identifiers = ["ecs.task.amazonaws.com"]

    }
   }

}

resource "aws_iam_role" "ecs_task" {
   name = "${local.app}-ecs-task"
   assume_role_policy  = data.aws_iam_policy_document.ecs_task_assume.json
}

data "aws_iam_policy_document" "ecs_assume" {
   statement {
      actions = ["sts.AssumeRole"]
   Principals {
      type = "Service"
      identiifiers = ["ecs.task.amazonaws.com"]
   }
 }
}

resource "aws_iam_role" "ecs" {
   name = "${local.app}"
   assume_role_policy = data.aws_iam_policy_document.ecs_assume.json
}

resource "aws_iam_role_policy" "ecs_basic" {
   name = "aws_iam_role.ecs.name"
   policy_arn = "arn:aws:iam:aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}



//復習2回目
//iam.tfの作成
$ touch iam.tf

data "aws_iam_policy_document" "ecs_task_assume" {
   statement {
      actions = ["sts:AssumeRole"]
      principals {
         type = "service"
         identifiers = ["ecs-tasks.amazonaws.com"]   
      }
   }
}

resource "aws_iam_role" "ecs_task" {
   name = "${local.app}-ecs-task"
   assume_role_policy = data.aws_iam_policy_document.ecs_task_assume.json
}

data "aws_iam_policy_document" "ecs_assume" {
   statement {
      actions = ["sts:AssumeRole"]
      principals {
         type = "Service"
         identifiers = ["ecs-tasks.amazon.com"]
      }
   }
}

resource "aws_iam_role" "ecs" {
   name = "${local.app}-ecs"
   assume_role_policy = data.aws_iam_policy_document.ecs_assume.json

}

resource "aws_iam_role_policy_attachment" "ecs_basic" {
   role       = aws_iam_role.ecs.name
   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


//復習3回目
//iam.tfの作成
$ touch iam.tf

data "aws_iam_policy_document" "ecs_task_assume" {
   statement {
      actions = [ "sts:AssumeRole" ]
      principals {
         type        = "Service"
         identifiers = ["ecs-tasks.amazonaws.com"]
      }
   }
} 

resource "aws_iam_role" "ecs_task" {
      name               = "${local.app}-ecs-task"
      assume_role_policy = data.aws_iam_policy_document.ecs_task_assume.json
}

data "aws_iam_policy_document" "ecs_assume" {
   statement {
      actions = [ "sts:AssumeRole" ]
      principals {
         type        = "Service"
         identifiers = ["ecs-tasks.amazonaws.com"]
      }
   }
}

resource "aws_iam_role"  "ecs" {
   name               = "${local.app}-ecs"
   assume_role_policy = data.aws_iam_policy_document.ecs_assume.json
}


resource "aws_iam_role_policy_attachment" "ecs_basic" {
      role       = aws_iam_role.ecs.name
      policy_arn = "arn:aws:iam::aws:polocy/service-role/AmazonECSTaskExecutionRolePolicy"
}

