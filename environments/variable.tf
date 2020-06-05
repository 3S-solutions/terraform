variable "common" {
    type = "map"
    default = {
        region = "ap-northeast-1"
        project = "xxxxx"
        vpc = "vpc-xxxxx"
        creat_user = "_Creat_user_"
    }
}

variable "ec2" {
    type = "map"
    default = {
        stg.count = "1"
        prd.count = "1"
    }
}

variable "alb" {
    type = "map"
    default = {
        stg.count = "1"
        prd.count = "1"
    }
}

variable "acm" {
    type = "map"
    default = {

    }
}

variable "iam" {
    type = "map"
    default = {
        
    }
}

