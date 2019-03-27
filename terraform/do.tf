
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "app" {
  name = "${var.project_name}"
  region = "fra1"
  size = "s-1vcpu-1gb"
  image = "docker-18-04"
  //ssh_keys = ["${digitalocean_ssh_key.kdm1.fingerprint}"]
}

/*resource "digitalocean_ssh_key" "kdm1" {
  name = "kdm1"
  public_key = "${file("./files/kdm1.pub")}"
}*/