variable "aws_region"{
    default = "us-east-1"
}

variable "PRIVATE_KEY_PATH"{
    default = "2152024"
}

variable "PUBLIC_KEY_PATH"{
    default = "2152024.pub"
}

variable "EC2_USER"{
    default ="ubuntu"
}

variable "AMI" {
    type = "map"

    default {
        us-east-1 = "ami-04b70fa74e45c3917"
    }
}