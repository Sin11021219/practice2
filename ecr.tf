//TerraformでECRの作成
$ git pull origin main
$ git checkout -b feat/ecr
$ touch ecr.tf

resource "aws_ecr_repository" "ecr_repository" {
    name = local.app
    image_tag_mutabiliy = "IMMUTABLE" 
    force_delete = true
    
    image_scanning_configuration {
        scan_on_push = true
    }

}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
   repository = aws_ecr_repository.ecr_repository.name

 policy  = <<EOF 
{
   "rules": [
     {
        "rulePriority : 1,
        "description" : "Keep last 30 images",
        "selection" : {
           "tagStatus" : "any"
           "countType : "imageCountMoreThan"
           countNumber : 30
        },
     "actinon": {
         "type": "expire"
         
      }
    }
  ]
   
}
EOF
}


//GitHubにpush 
$ git add . && git commit -m "Create ECR repository"
$ git push origin feat/ecr

//復習２回目
//TerraformでECRレポジトリの作成
$ git pull origin main
$ git checkout -b feat/ecr
$ touch ecr.tf 

resource "aws_ecr_repository" "ecr_repository" {
   name = local.app
   image_tag_mutability = "IMMUTABLE"
   force_delete = true


image_scanning_configuration {
   scan_on_push = true
 }
} 
resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
   repository = aws_ecr_repository.ecr_repository.name

   policy = <<EOF
{
   "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 30 images",
        "selection": {
          "tagstatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": 30
        },
        "action": {
         "type": "expire"
        }

      }
   ]
}
EOF
}

//GitHubにプッシュ
$ git add . && git commit -m "Create ECR repository"
$ git push origin feat/ecr

//復習３回目
//Terraformを使ってECRレポジトリを作成
$ git pull origin main
$ git checkout -b feat/ecr

resource "aws_ecr_repository" "ecr_repository" {
   name                 = local.app
   image_tag_mutability = "IMMUTABLE"
   force_delete         = true

  image_scanning_configuration {
   scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy"{
   repository = aws_ecr_repository.ecf_repository.name

   policy = <<EOF
{
   "rules": [
      {
         "rulePriority": 1,
          "description": "Keep last 30 images",
            "selection": {
              "tagStatus": "any",
              "countType": "imageCountMoreThan",
              "countNumber": 30
        },
          "action": {
            "type": "expire"
        }

      }
   ]
}
EOF
}

//GitHubにプッシュ
$ git add . && git commit -m "Create ECR repository"
$ git push origin feat/ecr





