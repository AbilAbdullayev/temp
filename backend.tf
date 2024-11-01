# Backend pointed to Root account
terraform {
  backend "s3" {
    bucket = "terraform-1-tfstates"
    key    = "terraform.tfstate"
  }
}
