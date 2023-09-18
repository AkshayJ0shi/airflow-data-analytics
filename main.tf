provider "aws" {
  region = "ap-south-1"
}

# VARIABLES
variable "landing_bucket" {
  type        = string
  description = "This bucket is used like data lake and the data in this bucket is not directly worked upon."
  default     = "airflow_analytics_apsouth1_landing-bucket"
}

variable "intermediate_bucket" {
  type        = string
  description = "Data in this bucket is copied from landing bucket and is then processed."
  default     = "airflow_analytics_apsouth1_intermediate-bucket"
}

variable "clean_bucket" {
  type        = string
  description = "This bucket contains preprocessed clean csv data used for modelling and visualization."
  default     = "airflow_analytics_apsouth1_clean-bucket"
}


# RESOURCES
resource "aws_s3_bucket" "bucket1" {
  bucket = var.landing_bucket

  tags = {
    name        = "airflow-analytics-project",
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = var.intermediate_bucket

  tags = {
    name        = "airflow-analytics-project",
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket3" {
  bucket = var.clean_bucket

  tags = {
    name        = "airflow-analytics-project",
    Environment = "Dev"
  }
}