job "adapt-runner" {
  type = "service"

  group "runner-grp" {
    count = 1
    network {
      port "http" {
        static = 5000
      }
      port webrtc {}
    }

    service {
      name     = "adapt-runner-svc"
      provider = "nomad"
    }

    task "adapt-runner-task" {
      template {
        data        = <<EOH
NOMAD_ADDR="{{ env NOMAD_ADDR }}"
NOMAD_TOKEN="{{ env NOMAD_TOKEN }}"
EOH
        destination = "local/env.txt"
        env         = true
      }

      driver = "docker"

      config {
        image = "{{ env }}"
        ports = ["http"]
      }
    }
  }
}