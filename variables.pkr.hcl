variable "azure_subscription_id" {
  type    = string
  default = env("AZURE_SUBSCRIPTION_ID")
}

variable "azure_region" {
  type    = string
  default = "East US"
}
