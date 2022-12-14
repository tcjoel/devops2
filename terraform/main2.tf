provider "aws" {
    region = us-weast-2
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my_vpc"
  }
}
resource "aws_subnet" "my_subent" {
  vpc_id     = aws_vpc.my_subent.id
  cidr_block = "10.0.1.0/26"
  auto_assigne_public

  tags = {
    Name = "my_subnet"
  }
}