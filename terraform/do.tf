
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "app" {
  name = "${var.project_name}"
  region = "${var.region}"
  size = "${var.size}"
  image = "${var.image}"
  ssh_keys = ["${digitalocean_ssh_key.kdm1.fingerprint}"]
}

resource "digitalocean_ssh_key" "kdm1" {
  name = "kdm1"
  public_key = "${file("./files/kdm1.pub")}"
}