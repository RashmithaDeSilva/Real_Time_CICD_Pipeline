# Pulls the image
resource "docker_image" "sonarqube_image" {
  name = "sonarqube:lts-community"
}
# If you did not install jenkins you can uncomment and run jenkins container
# resource "docker_image" "jenkins_image" {
#   name = "jenkins/jenkins:lts"
# }


# Create volume
# Uncomment if use jenkins container
# resource "docker_volume" "jenkins_volume" {
#   name = "jenkins_data"
# }


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
# resource "docker_container" "jenkins_container" {
#   image     = docker_image.jenkins_image.name
#   name      = "jenkins"
#   restart   = "unless-stopped"
#   tty         = true
#   stdin_open = true
#   start       = true
#   volumes {
#     volume_name    = docker_volume.jenkins_volume.name
#     container_path = "/var/jenkins_home"
#   }
#   volumes {
#     # Connect with docker
#     host_path      = "/var/run/docker.sock"
#     container_path = "/var/run/docker.sock"
#   }
#   volumes {
#     # Connect with projects
#     host_path      = "/Real_Time_CICD_Pipeline/jenkins_pipeline_scripts"
#     container_path = "/projects"
#   }
#   ports {
#     internal = 8080
#     external = 8080
#   }
# }