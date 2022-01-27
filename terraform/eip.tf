resource "aws_eip" "realshinkitv-ngw-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.realshinkitv-igw]

  tags = {
    Name = "realshinkitv-ngw-eip"
  }
}
