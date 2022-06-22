/* VPC */
resource "aws_vpc" "portfolio-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "portfolio-vpc"
  }
}

/* IGW */
resource "aws_internet_gateway" "portfolio-igw" {
  vpc_id = aws_vpc.portfolio-vpc.id

  tags = {
    Name = "portfolio-igw"
  }
}

/* Subnet */
resource "aws_subnet" "portfolio-front-1a" {
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "portfolio-front-1a"
  }
}
resource "aws_subnet" "portfolio-front-1c" {
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "portfolio-front-1c"
  }
}
resource "aws_subnet" "portfolio-back-1a" {
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "portfolio-back-1a"
  }
}
resource "aws_subnet" "portfolio-back-1c" {
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "portfolio-back-1c"
  }
}

/* RouteTable */
resource "aws_route_table" "portfolio-front-rtb" {
  vpc_id = aws_vpc.portfolio-vpc.id

  route {
    gateway_id = aws_internet_gateway.portfolio-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "portfolio-front-rtb"
  }
}
resource "aws_route_table" "portfolio-back-rtb" {
  vpc_id = aws_vpc.portfolio-vpc.id

  route {
    gateway_id = aws_internet_gateway.portfolio-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "portfolio-back-rtb"
  }
}

resource "aws_route_table_association" "portfolio-front-rtb-1a" {
  subnet_id      = aws_subnet.portfolio-front-1a.id
  route_table_id = aws_route_table.portfolio-front-rtb.id
}
resource "aws_route_table_association" "portfolio-front-rtb-1c" {
  subnet_id      = aws_subnet.portfolio-front-1c.id
  route_table_id = aws_route_table.portfolio-front-rtb.id
}
resource "aws_route_table_association" "portfolio-back-rtb-1a" {
  subnet_id      = aws_subnet.portfolio-back-1a.id
  route_table_id = aws_route_table.portfolio-back-rtb.id
}
resource "aws_route_table_association" "portfolio-back-rtb-1c" {
  subnet_id      = aws_subnet.portfolio-back-1c.id
  route_table_id = aws_route_table.portfolio-back-rtb.id
}


/* Add   after ECS deploy  */
resource "aws_eip" "portfolio-ngw-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.portfolio-igw]

  tags = {
    Name = "portfolio-ngw-eip"
  }
}


resource "aws_nat_gateway" "portfolio-ngw" {
  allocation_id = aws_eip.portfolio-ngw-eip.id
  subnet_id     = aws_subnet.portfolio-front-1a.id
  depends_on    = [aws_internet_gateway.portfolio-igw]

  tags = {
    Name = "portfolio-ngw"
  }
}
