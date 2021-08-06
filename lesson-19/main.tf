module "s3_full_access_iam_policy" {
  source = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name        = "s3-full-access"
  path        = "/"
  description = "s3-full-access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

data "aws_caller_identity" "this" {}

module "iam_assumable_role_custom" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root",
  ]

  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  create_role = true

  role_name         = "s3-full-access-role"
  role_requires_mfa = false

  role_sts_externalid = "s3-full-access-role"

  custom_role_policy_arns = [
    module.s3_full_access_iam_policy.arn
  ]
}
