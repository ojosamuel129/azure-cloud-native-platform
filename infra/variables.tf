variable "location" {
  type    = string
  default = "uksouth"
}

variable "project" {
  type    = string
  default = "cnp"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "acr_name" {
  type        = string
  description = "Globally unique registry name, 5 to 50 lowercase letters and numbers"
}
