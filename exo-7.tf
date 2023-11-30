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
              docker run -d -p 80:80 -e node=Server  jialezi/html5-speedtest
              EOF
  }

output "instance_ip" {
value =  vultr_instance.ouibonjour.main_ip
}