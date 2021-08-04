data "template_file" "ssm_install_nginx_script" {
  template = file("${path.module}/install_nginx.yml")

  vars = {
    package_name = "redis"
  }
}

output "ssm_install_nginx_script" {
  value = data.template_file.ssm_install_nginx_script.rendered
}
