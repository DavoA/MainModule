### VPC ###
variable "cidr_block" {
    description = "VPC cidr block"
    type = string
    default = "10.0.0.0/16"
}

variable "public_cidr_block" {
    description = "VPC public subnet cidr block"
    type = string
    default = "10.0.10.0/24"
}

variable "private_cidr_block" {
    description = "VPC private subnet cidr block"
    type = string
    default = "10.0.20.0/24"
}

### LAMBDA FUNCTION ###
variable "function_name" {
    type        = string
    description = "The name of the Lambda function"
}

variable "handler" {
    type        = string
    description = "The entry point for the Lambda function, in the form of 'filename.method'"
}

variable "runtime" {
    type        = string
    description = "The runtime environment for the Lambda function"
}

### AUTO SCALING GROUP ###
variable "ami_id" {
    description = "The ID of the AMI to use for the instances"
}

variable "instance_type" {
    description = "The instance type to use for the instances"
}

variable "min_size" {
    description = "The minimum number of instances in the Auto Scaling Group"
}

variable "max_size" {
    description = "The maximum number of instances in the Auto Scaling Group"
}

variable "desired_capacity" {
    description = "The desired capacity of the Auto Scaling Group"
}

variable "asg_name" {
    description = "The name of the Auto Scaling Group"
}

### CLOUDFRONT ###
variable "domain_name" {
    type = string
}

variable "origin" {
    type = string
}

variable "viewer_protocol_policy" {
    type    = string
    default = "redirect-to-https"
}

variable "allowed_methods" {
    type    = list(string)
    default = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
}

variable "cached_methods" {
    type    = list(string)
    default = ["GET", "HEAD"]
}

variable "default_ttl" {
    type    = number
    default = 3600
}

variable "max_ttl" {
    type    = number
    default = 86400
}

variable "default_root_object" {
    type    = string
    default = "index.html"
}

### LOAD BALANCER ###
variable "load_balancer_security_group_id" {
    description = "Security group id for the load balancer"
}

variable "load_balancer_subnets" {
    description = "Subnets for the load balancer"
    type        = list(string)
}

### S3 ###
variable "bucket_name" {
    type        = string
    description = "Name of the S3 bucket"
}

variable "iam_role_name" {
    type        = string
    description = "Name of the IAM role"
}


