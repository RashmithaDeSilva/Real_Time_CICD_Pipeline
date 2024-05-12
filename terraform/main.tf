# Pulls the image
resource "docker_image" "sonarqube_image" {
  name = "sonarqube:lts-community"
}


# Create a container
resource "docker_container" "sonarqube_container" {
  image     = docker_image.sonarqube_image.name
  name      = "sonarqube"
  restart   = "unless-stopped"
  tty         = true
  stdin_open = true
  start       = true
  ports {
    internal = 9000
    external = 9000
  }
}