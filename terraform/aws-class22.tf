provider "aws" {
    region = us-east-1
    access_key =
    secret_key =
}
# vpc creation
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc"
    }
}
# subnet creation
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "public_subnet"
    }
}
# internet gate way creation
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}
# route table creation
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}
# route table association
resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_vpc.my_vpc.id
  route_table_id = aws_route_table.bar.id
}

resource "aws_route_table_association" "b" {
  gateway_id     = aws_internet_gateway.my_igw.id
  route_table_id = aws_route_table.bar.id
}