/* VPC */
resource "aws_vpc" "realshinkitv-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "realshinkitv-vpc"
  }
}

/* IGW */
resource "aws_internet_gateway" "realshinkitv-igw" {
  vpc_id = aws_vpc.realshinkitv-vpc.id

  tags = {
    Name = "realshinkitv-igw"
  }
}

/* Subnet */
resource "aws_subnet" "realshinkitv-front-1a" {
  vpc_id                  = aws_vpc.realshinkitv-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "realshinkitv-front-1a"
  }
}
resource "aws_subnet" "realshinkitv-front-1c" {
  vpc_id                  = aws_vpc.realshinkitv-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "realshinkitv-front-1c"
  }
}
resource "aws_subnet" "realshinkitv-back-1a" {
  vpc_id                  = aws_vpc.realshinkitv-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "realshinkitv-back-1a"
  }
}
resource "aws_subnet" "realshinkitv-back-1c" {
  vpc_id                  = aws_vpc.realshinkitv-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "realshinkitv-back-1c"
  }
}

/* RouteTable */
resource "aws_route_table" "realshinkitv-front-rtb" {
  vpc_id = aws_vpc.realshinkitv-vpc.id

  route {
    gateway_id = aws_internet_gateway.realshinkitv-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "realshinkitv-front-rtb"
  }
}
resource "aws_route_table" "realshinkitv-back-rtb" {
  vpc_id = aws_vpc.realshinkitv-vpc.id

  route {
    gateway_id = aws_internet_gateway.realshinkitv-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "realshinkitv-back-rtb"
  }
}

resource "aws_route_table_association" "realshinkitv-front-rtb-1a" {
  subnet_id      = aws_subnet.realshinkitv-front-1a.id
  route_table_id = aws_route_table.realshinkitv-front-rtb.id
}
resource "aws_route_table_association" "realshinkitv-front-rtb-1c" {
  subnet_id      = aws_subnet.realshinkitv-front-1c.id
  route_table_id = aws_route_table.realshinkitv-front-rtb.id
}
resource "aws_route_table_association" "realshinkitv-back-rtb-1a" {
  subnet_id      = aws_subnet.realshinkitv-back-1a.id
  route_table_id = aws_route_table.realshinkitv-back-rtb.id
}
resource "aws_route_table_association" "realshinkitv-back-rtb-1c" {
  subnet_id      = aws_subnet.realshinkitv-back-1c.id
  route_table_id = aws_route_table.realshinkitv-back-rtb.id
}
