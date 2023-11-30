provider "github" {
  token = "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"
}
resource "github_repository" "mon_repo" {
  name        = var.mon_repo
  description = "Créé avec Terraform"
}
