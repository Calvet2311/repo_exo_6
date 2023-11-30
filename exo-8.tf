terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.17.1" 
    }
  }
}

provider "vultr" {
  api_key = "SILLVA2A6J3F6S4SKKSNXAPFNZFMWNFF2MRA"
}

resource "vultr_instance" "ouibonjour" {
  region  = "fra"
  plan    = "vc2-1c-1gb"
  os_id   = "352"


 user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              docker run -d \
              --name wordpress \
              -p 8080:80 \
              -e WORDPRESS_DB_HOST=mysql \
              -e WORDPRESS_DB_USER=wp_user \
              -e WORDPRESS_DB_PASSWORD=wp_password \
              -e WORDPRESS_DB_NAME=wordpress \
              wordpress:latest
              docker run -d \
              --name mysql \
              -e MYSQL_ROOT_PASSWORD=root_password \
              -e MYSQL_DATABASE=wordpress \
              -e MYSQL_USER=wp_user \
              -e MYSQL_PASSWORD=wp_password \
              mysql:5.7
              EOF
  }

output "instance_ip" {
value =  vultr_instance.ouibonjour.main_ip
}