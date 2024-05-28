#1. Create Internet Gateway

resource "aws_internet_gateway" "myigw"{
    vpc_id = "${aws_vpc.myvpc.id}

    tags{
        name = "myigw"
    }

}

#2. Create Custom Route Table

resource "aws_route_table" "myrt"{
    vpc_id = ${aws_vpc.myvpc.id}

route{ 
cidr_block = "0.0.0.0/0"  //associated subnet can reach everywhere
gateway_id "${aws_internet_gateway.myigw.id}   //CRT uses this IGW to reach internet
}

tags {
    name = "myrt"
}

}

#3. Associate CRT and Subnet

resource "aws_route_table_association" "rtsnasso"{
    subnet_id = "${aws_subnet.rtsnasso.id}"
    aws_route_table = "${aws_route_table.myrt.id}"
}

#4. Create a Security Group

resource "aws_security_group" "allowed 22-443-80"{
    vpc_id = "${aws_vpc.myvpc.id}"

        egress{
            from_port = 0
            to_port = 0
            protocol = -1
            cidr_blocks = ["0.0.0.0/0"]
        }

        ingress { 
             from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        tags {
            name = "allowed 22-443-80"
        }
}"