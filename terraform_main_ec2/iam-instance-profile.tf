resource "aws_iam_instance_profile" "instance-profile" {
  name = "profile"
  role = aws_iam_role.iam-role.name
}
