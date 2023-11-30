# repo_exo_6
Créé avec Terraform
1. Création du token classic depuis l'interface developer sur github
2. Approbation de toute les permissions pour permette l'accès au prof
3. Utilisation du code ci-dessous pour pouvoir faire la connexion entre terraform et Github
4. provider "github"{
   token = "votre_token_github"
   }
5. Nous remplaçons "votre_token_github" par notre token ici "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"
6. Ajout du code ci-dessous pour pouvoir créer un repository sur notre compte Github
   resource "github_repository" "mon_repo" {
   name        = var.mon_repo
   description = "Créé avec Terraform"
}

7. Création du notre fichier var avec le code ci-dessous
   variable "nom_du_repo" {
  description = "Nom du dépôt GitHub"
  type        = string
}

8. Ecriture du fichier python pour créer notre repository
