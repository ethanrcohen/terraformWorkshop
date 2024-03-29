resource "google_compute_instance" "main" {
    name = "nginx"
    machine_type = "f1-micro"

    boot_disk{
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    metadata = {
      environment = "test"
    }

    network_interface  {
        network = "default"

        access_config {
             // Epehemeral public IP
        }
    }

    provisioner "remote-exec" {
      connection {
        host = google_compute_instance.main.network_interface[0].access_config[0].nat_ip
        user = "user"
        private_key = file("~/.ssh/google_compute_engine")
      }

      inline = [
        "sudo apt install -y nginx"
      ]
    }
}

resource "google_compute_firewall" "http" {
  name = "external-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [80]
  }

  source_ranges = ["0.0.0.0/0"]
}