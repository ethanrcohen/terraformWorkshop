module "gcp_nginx" {
  source = "../modules/gcp_vm"

  name = "nginx"
}

module "dns" {
  source = "../modules/cf_dns"

  name = "ethan"
  ip   = module.gcp_nginx.public_ip
}