provider "aws" {
  region = "us-east-1"
}


// IAM create user and group for spark hadoop. Spark admin get full control of
// EC2
resource "aws_iam_user" "spark_admin" {
  name = "spark_admin"
}

resource "aws_iam_user_policy_attachment" "spark_admin_attach" {
  user       = aws_iam_user.spark_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_access_key" "spark_admin_key" {
  user = aws_iam_user.spark_admin.name
}




