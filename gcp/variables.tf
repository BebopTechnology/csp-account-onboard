variable "project" {
  description = "Google Compute Project"
  type        = string
}

variable "region" {
  description = "Google Compute Region"
  type        = string
}

variable "iam_access_level" {
  description = "Enter 'full' for Bebop to manage all resource including IAM or 'minimal' to self-manage IAM and grant Bebop the minimal required permissions."
  type        = string
  validation {
    condition     = lower(var.iam_access_level) == "full" || lower(var.iam_access_level) == "minimal"
    error_message = "The value should either be one of 'full' or 'minimal'."
  }
}
