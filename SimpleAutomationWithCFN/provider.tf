terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }  
  }
}


provider "aws" {
      region = "us-east-1"
      shared_credentials_file = "/home/irfan/.aws/credentials"
      profile= "la"
}

/*
Resources
https://stackoverflow.com/questions/45002292/terraform-correct-way-to-attach-aws-managed-policies-to-a-role
https://devopslearning.medium.com/aws-iam-ec2-instance-role-using-terraform-fa2b21488536#:~:text=IAM%20Roles%20are%20used%20to,permission%20to%20your%20EC2%20instances.&text=assume_role_policy%20%E2%80%94%20(Required)%20The%20policy,permission%20to%20assume%20the%20role.
https://stackoverflow.com/questions/55404300/how-can-i-attach-multiple-pre-existing-aws-managed-roles-to-a-policy
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
*/
