provider "google" {
  version = "2.14.0"
  credentials = "${file("account.json")}"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "kubernetes" {
  name         = "kuber-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  count = 4

  metadata = {
    ssh-keys = "maxim:${file(var.public_key_path)}"
  }

  metadata_startup_script = "sudo apt update ; sudo apt install -y python ; sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common ; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ; sudo add-apt-repository  'deb [arch=amd64] https://download.docker.com/linux/ubuntu '$(lsb_release -cs)' stable' ; sudo apt-get install -y docker-ce docker-ce-cli containerd.io"

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config {
    }
  }

  tags = ["kuber"]

}


resource "google_compute_network" "iscsi_network" {
  name = "iscsi-network"
}



resource "google_compute_firewall" "firewall_kuber" {
  name    = "allow-kuber-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["6443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kuber"]
}

