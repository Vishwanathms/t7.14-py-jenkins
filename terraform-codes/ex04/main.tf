# Random Secret + Locals + Sensitive Variable

# -------------------------
# 1. Random Generator
# -------------------------
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}



output "db_pass" {
  description = "Generated random DB password"
  value       = random_password.db_password.result
  sensitive   = true 

}


# -------------------------
# 2. Local Values
# -------------------------
resource "random_pet" "env_suffix" {
  length    = 3
  separator = "-"
}

locals {
  project_name = "demo-app"
  env          = "dev"
  identifier   = "${local.project_name}-${local.env}-${random_pet.env_suffix.id}"
}

output "resource_identifier" {
  description = "Unique project identifier"
  value       = local.identifier
}


# -------------------------
# 3. Secrets via Variables
# -------------------------
variable "api_key" {
  description = "External API Key"
  type        = string
  sensitive   = true
}

output "api_key" {
  description = "API Key from variable"
  value       = var.api_key
  sensitive   = true
}