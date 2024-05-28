# 1. Creating a VPC

resource "aws_vpc" "myvpc"{
     cidr_block = "10.0.0.0/16"
     enable_dns_support = "true" #gives you an internal domain name
     enable_dns_hostnames = "true" #gives you an internal host name
     enable_classiclink = "false"
     instance_tenancy = "default"

     tags {
        Name = "myvpc"
     }
}

#2. Creating a Subnet

resource "aws_subnet" "mysub"{
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1"

    tags{
        name = "mysub"
    }

}
