# AIClouds

locals {
  version    = "v.2"
  project_id = lower(replace(var.project_name, " ", "-"))
}

module "resource-group" {
  providers    = { aws = aws.project }
  source       = "./modules/resource-group"
  project_name = local.project_id
}

module "app-root-bucket" {
  providers           = { aws = aws.project }
  source              = "./modules/bucket"
  bucket_name         = "${local.project_id}-app-root-bucket"
  origin_policy_id    = try(module.cloudfront.origin_access_control_id, "undefined")
  cloudfront_dist_arn = try(module.cloudfront.aws_cloudfront_dist_arn, "undefined")
  project_region      = var.project_default_region

  application_tags = try(module.resource-group.aws_application_tag, {})
}


module "app-static-bucket" {
  providers           = { aws = aws.project }
  source              = "./modules/bucket"
  bucket_name         = "${local.project_id}-app-static-bucket"
  origin_policy_id    = try(module.cloudfront.origin_access_control_id, "undefined")
  cloudfront_dist_arn = try(module.cloudfront.aws_cloudfront_dist_arn, "undefined")
  project_region      = var.project_default_region

  application_tags = try(module.resource-group.aws_application_tag, {})
}

module "cloudfront" {
  providers = { aws = aws.project }
  source    = "./modules/cloudfront"

  count = 0

  # Set resource manager tags(experimental)
  aws_application_tags = module.resource-group.aws_application_tag

  # root backet with application
  root_bucket_domain_name = module.app-root-bucket.aws_bucket_regional_domain_name

  # static backet with application
  static_bucket_domain_name = module.app-static-bucket.aws_bucket_regional_domain_name

}
