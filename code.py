import subprocess
import sys

def run_terraform_with_repo_name(repo_name):
    subprocess.run(["terraform", "apply", f"-var=nom_repo={repo_name}", "-auto-approve"])
    print("Terraform apply terminé avec succès.")

def main():
    repo_name = sys.argv[1]
    run_terraform_with_repo_name(repo_name)

if __name__ == "__main__":
    main()