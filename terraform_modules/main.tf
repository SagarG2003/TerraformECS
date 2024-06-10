provider "aws" {
  region = "us-east-1" 
}

variable "app_name" {
  default = "hello-world-nodejs"
}

variable "region" {
  default = "us-east-1"
}
