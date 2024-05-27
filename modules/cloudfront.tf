resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name = var.origin
    origin_id   = var.origin
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "My CloudFront Distribution"
  default_root_object = var.default_root_object
  default_cache_behavior {
    target_origin_id   = var.origin
    viewer_protocol_policy = var.viewer_protocol_policy
    allowed_methods = var.allowed_methods
    cached_methods  = var.cached_methods
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl = 0
    default_ttl = var.default_ttl
    max_ttl = var.max_ttl
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
