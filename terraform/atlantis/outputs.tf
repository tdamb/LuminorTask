output "atlantis_url" {
  description = "URL to access the Atlantis service."
  value       = "http://${module.atlantis.load_balancer_hostname}"
}
