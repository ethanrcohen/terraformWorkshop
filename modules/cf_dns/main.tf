resource "cloudflare_record" "main" {
  zone_id = var.cf_zone_id
  name = "${var.name}.${var.domain}"
  type = "A"
  value = var.ip
  ttl = 300
  proxied = false
}