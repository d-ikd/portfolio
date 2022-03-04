resource "aws_route_table" "realshinkitv-frontend-rtb" {
  vpc_id = aws_vpc.realshinkitv-vpc.id

  route {
    gateway_id = aws_internet_gateway.realshinkitv-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "realshinkitv-frontend-rtb"
  }
}
resource "aws_route_table" "realshinkitv-backend-rtb" {
  vpc_id = aws_vpc.realshinkitv-vpc.id

  route {
    gateway_id = aws_internet_gateway.realshinkitv-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "realshinkitv-backend-rtb"
  }
}

resource "aws_route_table_association" "realshinkitv-frontend-rtb-1a" {
  subnet_id      = aws_subnet.realshinkitv-frontend-1a.id
  route_table_id = aws_route_table.realshinkitv-frontend-rtb.id
}
resource "aws_route_table_association" "realshinkitv-frontend-rtb-1c" {
  subnet_id      = aws_subnet.realshinkitv-frontend-1c.id
  route_table_id = aws_route_table.realshinkitv-frontend-rtb.id
}
resource "aws_route_table_association" "realshinkitv-backend-rtb-1a" {
  subnet_id      = aws_subnet.realshinkitv-backend-1a.id
  route_table_id = aws_route_table.realshinkitv-backend-rtb.id
}
resource "aws_route_table_association" "realshinkitv-backend-rtb-1c" {
  subnet_id      = aws_subnet.realshinkitv-backend-1c.id
  route_table_id = aws_route_table.realshinkitv-backend-rtb.id
}
