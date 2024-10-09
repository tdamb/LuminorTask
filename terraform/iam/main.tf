data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "eks_admin_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_admin" {
  name = var.eks_admin_role_name

  assume_role_policy = data.aws_iam_policy_document.eks_admin_assume_role.json
}


data "aws_iam_policy_document" "eks_readonly_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_readonly" {
  name = var.eks_readonly_role_name

  assume_role_policy = data.aws_iam_policy_document.eks_readonly_assume_role.json
}
