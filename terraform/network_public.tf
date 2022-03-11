/* VPC */
resource "aws_vpc" "cs-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "cs-vpc"
  }
}

/* IGW */
resource "aws_internet_gateway" "cs-igw" {
  vpc_id = aws_vpc.cs-vpc.id

  tags = {
    Name = "cs-igw"
  }
}

/* Subnet */
resource "aws_subnet" "cs-front-1a" {
  vpc_id                  = aws_vpc.cs-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "cs-front-1a"
  }
}
resource "aws_subnet" "cs-front-1c" {
  vpc_id                  = aws_vpc.cs-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "cs-front-1c"
  }
}
resource "aws_subnet" "cs-back-1a" {
  vpc_id                  = aws_vpc.cs-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "cs-back-1a"
  }
}
resource "aws_subnet" "cs-back-1c" {
  vpc_id                  = aws_vpc.cs-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "cs-back-1c"
  }
}

/* RouteTable */
resource "aws_route_table" "cs-front-rtb" {
  vpc_id = aws_vpc.cs-vpc.id

  route {
    gateway_id = aws_internet_gateway.cs-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "cs-front-rtb"
  }
}
resource "aws_route_table" "cs-back-rtb" {
  vpc_id = aws_vpc.cs-vpc.id

  route {
    gateway_id = aws_internet_gateway.cs-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "cs-back-rtb"
  }
}

resource "aws_route_table_association" "cs-front-rtb-1a" {
  subnet_id      = aws_subnet.cs-front-1a.id
  route_table_id = aws_route_table.cs-front-rtb.id
}
resource "aws_route_table_association" "cs-front-rtb-1c" {
  subnet_id      = aws_subnet.cs-front-1c.id
  route_table_id = aws_route_table.cs-front-rtb.id
}
resource "aws_route_table_association" "cs-back-rtb-1a" {
  subnet_id      = aws_subnet.cs-back-1a.id
  route_table_id = aws_route_table.cs-back-rtb.id
}
resource "aws_route_table_association" "cs-back-rtb-1c" {
  subnet_id      = aws_subnet.cs-back-1c.id
  route_table_id = aws_route_table.cs-back-rtb.id
}
