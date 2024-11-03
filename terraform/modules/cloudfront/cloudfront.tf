resource "aws_cloudfront_distribution" "dist" {
    # aliases                         = ["aws.lab.aiclouds.io"]
    aliases = []
    http_version                    = "http2"

    price_class                     = "PriceClass_All"
    retain_on_delete                = false
    staging                         = false

    enabled                         = true
    wait_for_deployment             = false
    is_ipv6_enabled                 = true
    web_acl_id                      = null

    # logging_config {
    #     include_cookies = false
    #     bucket          = "mylogs.s3.amazonaws.com"
    #     prefix          = "myprefix"
    # }

    default_root_object = "index.html"
    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = local.s3_origin_id

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "allow-all"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }

    # Cache behavior with precedence 1
    # ordered_cache_behavior {
    #     path_pattern     = "/assets/images/*"
    #     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    #     cached_methods   = ["GET", "HEAD"]
    #     target_origin_id = local.s3_origin_id

    #     forwarded_values {
    #     query_string = false

    #     cookies {
    #         forward = "none"
    #     }
    #     }

    #     min_ttl                = 0
    #     default_ttl            = 3600
    #     max_ttl                = 86400
    #     compress               = true
    #     viewer_protocol_policy = "redirect-to-https"
    # }

    # Origins
    # 2ref: strong
    origin {
        origin_id                = "root"
        origin_path              = "/"
        connection_attempts      = 3
        connection_timeout       = 10
        domain_name              = var.root_bucket_domain_name
        origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    }

    origin {
        origin_id                = "static"
        origin_path              = "/static"
        connection_attempts      = 3
        connection_timeout       = 10
        domain_name              = var.static_bucket_domain_name
        origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    }
    #
    
    # Restrictions
    restrictions {
        geo_restriction {
            locations        = []
            restriction_type = "none"
        }
    }

    tags = var.aws_application_tags

    viewer_certificate {
        # acm_certificate_arn            = null
        cloudfront_default_certificate = true
        # iam_certificate_id             = null
        # minimum_protocol_version       = "TLSv1"
        # ssl_support_method             = null
    }
}
