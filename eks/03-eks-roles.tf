# Create IAM Role
resource "aws_iam_role" "nk_eks_master_role" {
  name = "nk_terraform-eks-master-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# 为角色绑定权限
resource "aws_iam_role_policy_attachment" "terraform-eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.nk_eks_master_role.name
}

resource "aws_iam_role_policy_attachment" "terraform-eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.nk_eks_master_role.name
}
