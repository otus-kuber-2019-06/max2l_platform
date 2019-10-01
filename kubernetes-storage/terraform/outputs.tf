output "kuber_external_ip" {
  value = "${google_compute_instance.kubernetes[*].network_interface[*].access_config.*.nat_ip[0]}"
}


