/* VPC */
resource "aws_vpc" "myportfolio-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "myportfolio-vpc"
  }
}

/* IGW */
resource "aws_internet_gateway" "myportfolio-igw" {
  vpc_id = aws_vpc.myportfolio-vpc.id

  tags = {
    Name = "myportfolio-igw"
  }
}

/* Subnet */
resource "aws_subnet" "myportfolio-front-1a" {
  vpc_id                  = aws_vpc.myportfolio-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "myportfolio-front-1a"
  }
}
resource "aws_subnet" "myportfolio-front-1c" {
  vpc_id                  = aws_vpc.myportfolio-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "myportfolio-front-1c"
  }
}
resource "aws_subnet" "myportfolio-back-1a" {
  vpc_id                  = aws_vpc.myportfolio-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "myportfolio-back-1a"
  }
}
resource "aws_subnet" "myportfolio-back-1c" {
  vpc_id                  = aws_vpc.myportfolio-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "myportfolio-back-1c"
  }
}

/* RouteTable */
resource "aws_route_table" "myportfolio-front-rtb" {
  vpc_id = aws_vpc.myportfolio-vpc.id

  route {
    gateway_id = aws_internet_gateway.myportfolio-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "myportfolio-front-rtb"
  }
}
resource "aws_route_table" "myportfolio-back-rtb" {
  vpc_id = aws_vpc.myportfolio-vpc.id

  route {
    gateway_id = aws_internet_gateway.myportfolio-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "myportfolio-back-rtb"
  }
}

resource "aws_route_table_association" "myportfolio-front-rtb-1a" {
  subnet_id      = aws_subnet.myportfolio-front-1a.id
  route_table_id = aws_route_table.myportfolio-front-rtb.id
}
resource "aws_route_table_association" "myportfolio-front-rtb-1c" {
  subnet_id      = aws_subnet.myportfolio-front-1c.id
  route_table_id = aws_route_table.myportfolio-front-rtb.id
}
resource "aws_route_table_association" "myportfolio-back-rtb-1a" {
  subnet_id      = aws_subnet.myportfolio-back-1a.id
  route_table_id = aws_route_table.myportfolio-back-rtb.id
}
resource "aws_route_table_association" "myportfolio-back-rtb-1c" {
  subnet_id      = aws_subnet.myportfolio-back-1c.id
  route_table_id = aws_route_table.myportfolio-back-rtb.id
}
