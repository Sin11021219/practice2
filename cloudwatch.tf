//cloudwatchにロググループの作成
$ touch cloudwatch.tf

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
    name = "aws/ecs/${local.app}"
    retention_in_days = 1
}

//復習2回目
//cloudwatchにロググループの作成
$ touch cloudwatch.tf

resource "aws_clodwatch_log_group" "cloudwatch_log_group" {
    name = "/aws/ecs/${local.app}"
    retention_in_days = 1
}

//復習３回目
//cloudwatchにロググループの作成
$ touch cloudwatch.tf

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
    name              = "/aws/ecs/${local.app}"
    retention_in_days = 1
}