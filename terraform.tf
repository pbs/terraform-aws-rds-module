terraform {
  required_version = ">= 1.12.0"
  required_providers {
    # tflint-ignore: terraform_unused_required_providers
    aws = {
      version = ">= 5.100.0"
    }
    random = {
      version = ">= 3.1.0"
    }
  }
}
