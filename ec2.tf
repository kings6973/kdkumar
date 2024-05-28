resource "aws_instance" "myinstance1"{
    ami ="${lookup(var.ami, var.aws_region)}"
    instance_type = "t2.micro"

#vpc

subnet_id = "${aws_subnet.mysub.id}"

#aws_security_group

vpc_security_groups_ids = ["${aws_security_group.allowed-22-443-80.id}"]

#the public ssh key

key_name = "${aws_key_pair.2152024.id}"

#nginx installation

provisioner "file" {
    source = "nginx.sh"
    destination = "/tmp/nginx.sh"
}
provisioner "remote-exec"{
    inline = [
        "chmod +x /tmp/nginx.sh",
        "sudo /tmp/nginx.sh"
    ]
}

connection {
    user ="${var.EC2_USER}"
    private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
}

}

resource "aws_key_pair" "2152024"{
    key_name = "2152024"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
