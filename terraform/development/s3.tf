provider "aws" {
  region = var.region
}

# S3 Bucket 
resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = data.aws_iam_policy_document.client_portal_s3_policy.json

  cors_rule {
    allowed_headers = ["Authorizatioin", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
     max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
      Name = "Development"
  }
}

data "aws_iam_policy_document" "client_portal_s3_policy" {
    statement {
        actions = [
            "s3:GetObject"
        ]

        principals {
          identifiers = ["*"]
          type = "AWS"
        }

        resources = [
            "arn:aws:s3:::${var.bucket_name}/*"
        ]
    }
}