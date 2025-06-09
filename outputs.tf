output "externalsecret_release_status" {
  value = helm_release.external_secrets.status
}