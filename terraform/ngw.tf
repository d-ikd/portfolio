resource "aws_nat_gateway" "realshinkitv-ngw" {
  allocation_id = aws_eip.realshinkitv-ngw-eip.id
  subnet_id     = aws_subnet.realshinkitv-front-1a.id
  depends_on    = [aws_internet_gateway.realshinkitv-igw]

  tags = {
    Name = "realshinkitv-ngw"
  }
}
