# # Simple S3 Static Website
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~>6.5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# # Random suffix for unique bucket name
# resource "random_string" "bucket_suffix" {
#   length  = 8
#   special = false
#   upper   = false
# }

# # S3 Bucket
# resource "aws_s3_bucket" "website" {
#   bucket = "simple-website-${random_string.bucket_suffix.result}"
# }

# # Enable static website hosting
# resource "aws_s3_bucket_website_configuration" "website" {
#   bucket = aws_s3_bucket.website.id

#   index_document {
#     suffix = "index.html"
#   }
# }

# # Make bucket public
# resource "aws_s3_bucket_public_access_block" "website" {
#   bucket = aws_s3_bucket.website.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# # Bucket policy for public read
# resource "aws_s3_bucket_policy" "website" {
#   bucket = aws_s3_bucket.website.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${aws_s3_bucket.website.arn}/*"
#       }
#     ]
#   })

#   depends_on = [aws_s3_bucket_public_access_block.website]
# }

# # Upload the HTML file
# resource "aws_s3_object" "index" {
#   bucket       = aws_s3_bucket.website.id
#   key          = "index.html"
#   content_type = "text/html"

#   content = <<EOF
# <!DOCTYPE html>
# <html>
# <head>
#     <title>My Simple Website</title>
#     <style>
#         body { 
#             font-family: Arial, sans-serif; 
#             text-align: center; 
#             padding: 50px;
#             background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
#             color: white;
#             min-height: 100vh;
#             margin: 0;
#             display: flex;
#             align-items: center;
#             justify-content: center;
#         }
#         h1 { font-size: 3em; margin-bottom: 20px; }
#         p { font-size: 1.2em; }
#     </style>
# </head>
# <body>
#     <div>
#         <h1>Hello World!</h1>
#         <p>This website was created with Terraform!</p>
#         <p>Simple. Fast. Deployed to AWS S3.</p>
#     </div>
# </body>
# </html>
# EOF
# }

# # Output the website URL
# output "website_url" {
#   description = "Website URL"
#   value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
# }