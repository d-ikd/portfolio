resource "aws_eip" "myportfolio-ngw-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.myportfolio-igw]

  tags = {
    Name = "myportfolio-ngw-eip"
  }
}
