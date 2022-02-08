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
