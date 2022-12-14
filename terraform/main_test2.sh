# provider "aws" {
#     region = "us-east-2"
#     access_key = ""
#     secret_key = ""
# }
# resource "aws_vpc" "my_vpc" {
#     cidr_block = "192.168.0.0/24"
#     tags {
#         Name = "test-vpc"
#     }
# }
# resource "aws_subnet" "public_subnet" {
#     vpc_id = aws_vpc.my_vpc.id
#     cidr_block = "192.168.0.0/26"
#     availability_zones = "us-east-2a"
#     map_public_ip_on_launch = true
#     tags {
#         Name = "public-sub-test"
#     }
# }
# resource "aws_route_table" "public_RT" {
#     vpc_id = aws_vpc.my_vpc.id
#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.my_igw.id
#     }
# }
# resource "aws_internet_gateway" "my_igw" {
#     vpc_id = aws_vpc.my_vpc.id
#     tags {
#         Name = "test-igw"
#     }
# }
# resource "aws_security_group" "my_sg" {
#     vpc_id = aws_vpc.my_vpc.id
#     description = " Allow ssh and http access from the internet"
#     ingress {
#         description = "ssh from th internet"
#         from_port = 22
#         to_port   = 22
#         protocol  = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#         }
#     }
#     egress {
#         from_port  = 0
#         to_port    = 0
#         protocol   = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     ingress {
#         description  = "Allow http traffics"
#         from_port    = 80
#         to_port      = 80
#         protocol     = "tcp"
#         cidr_blocks  = ["0.0.0.0/0"]
#     }
#     egress {
#         from_port    = 0
#         to_port      = 0
#         protocol     = "-1"
#         cidr_blocks   = ["0.0.0.0/0"]
#     }
#     tags {
#         Name = "test-sg"
#     }
# }
# resource "aws_route_table_association" "test-rt-a" {
#     subnet_id  = aws_subnet.public_subnet.id
#     route_table_id = aws_route_table.public_RT.id
# }
# resource "aws_key_pair" "lab-test-22" {
#     key_name = "Devops"
#     public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWXQdEXmpGpp6h7c+a2Y7CE+f/ScyF43lDWQwHptdKKYeLwwVDFBSxTZetpQKqAuOA6sMJCS9Qh/5SPqatZvduID9909W/GklT4Gq+zd77XsvwqLu62twZ+mxe5aFqVR1+BtFy4NUAXNfO+lqtLgYjjqF6j2Y5zEI4ejliXD4nw3JSkVi29RmBqdZQdhpAPfJNFtP+KusXf9MYQPzIpQuxcJT6a+kPRhnZ2k8cFYgD3qxloTRgukPn43qOkGSLTXngfawd65PHFwdimkfqZiHk2gj0RDnjNUoWcoPqm5ce91LyC7sGm1lOKs8bWD/IiQXa01Fev2+1b/S58nVVKKFp Devops"
# "
# }
# resource "aws_instance" "tomcat-server" {
#     subnet_id = aws_subnet.aws.public_subnet.id
#     associate_public_ip_address = true
#     ami    = "ami-0b0af3577fe5e3532"
#     instance_type = "t2.micro"
#     security_groups = [aws_security_group.my_sg.id]
#     key_name = "lab-test-22"
# }
# resource "aws_s3_bucket" "any-bucket" {
#     bucket = "terraform-tomcat-bucket-joel-2022"
#     acl = "private-read"
#     versioning {
#         enabled = true
#     }
# }