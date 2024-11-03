resource "random_password" "hash" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  numeric  = true
}