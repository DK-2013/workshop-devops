
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "app" {
  name = "${var.project_name}"
  region = "fra1"
  size = "s-1vcpu-1gb"
  image = "docker-18-04"
  ssh_keys = ["${digitalocean_ssh_key.kdm1.fingerprint}"]
  //ssh_keys = ["8e:e6:21:67:02:a9:d6:6d:f1:be:04:e6:a8:f7:b0:5c"]
}

resource "digitalocean_ssh_key" "kdm1" {
  name = "kdm1"
  public_key = "${file("./files/kdm1.pub")}"
}
