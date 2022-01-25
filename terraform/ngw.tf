resource "aws_nat_gateway" "myportfolio-ngw" {
  allocation_id = aws_eip.myportfolio-ngw-eip.id
  subnet_id     = aws_subnet.myportfolio-front-1a.id
  depends_on    = [aws_internet_gateway.myportfolio-igw]

  tags = {
    Name = "myportfolio-ngw"
  }
}
