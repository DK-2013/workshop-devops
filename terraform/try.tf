
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
  name = "${var.project_name}"
  region = "${var.region}"
  size = "${var.size}"
  image = "${var.image"}
}