variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets."
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
}

variable "tags" {
  description = "Tags to be assigned to resources."
  type        = map(string)
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}
