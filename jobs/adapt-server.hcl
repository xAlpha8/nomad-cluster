job "adapt-server" {
  type = "service"

  group "server-grp" {
    count = 1
    network {
      port "http" {
        static = 80
      }
      port "https" {
        static = 443
      }
    }

    service {
      name     = "adapt-server-svc"
      port     = "http"
      provider = "nomad"
    }

    task "adapt-server-task" {
      driver = "docker"

      config {
        image = "992382383109.dkr.ecr.us-west-1.amazonaws.com/adapt-sdk-x64"
        auth {
          username = "AWS"
          password = "eyJwYXlsb2FkIjoiYytCVDlNdTFUeWRSRGVDd1J0Q3Qvdk1TNXF6NU45OWhxdUdyVUpvM2twWFN1akdxMnlKYWFCQTVHL0hrd3RiODNrMnNWQjk5eldNb2RYN3BrNkNtWWl5WkZyckdVaHVlL2FIaDlNdTY4SmxIU2pvZ3ZORzlzY1gycUYyZGs5YUNjaDRmSmljV2hFT0RaV2s1NkhpaW52QjcyYmlVVnZBdTJYVGF5WVIvbVNjQ2NBbEZGSlM0V3o0TVV5dUFHVUYvcGV5MitNaERaZHFpSlErYXpDdkp5OWpLdmdiVS80cU9idnliazZCaDFESHFWNS9HTzRWa0FoTTBvL3hYT0o0K0NQY05mbWVjaUpuWktubHVRczR1ZFFOUG96SDEvMHVIdmx4Q0l4MGhUWnI2Vkw2bmVIZDQzTjNnMkJFSXdBWHdjOTJTaEVVWHNYTzl1UVNEQkJHMncyMEhkYXhISUZvanE2bFYrVjRTeXFOOFRYeFlkYXVpSkNlZTFvUytCdUhqQXpYeWtJbDFGYzN5dGhDajlLcUdkVmNTQmUyK3hmU2piUGZIeUJUdjRKTWRmR2gvbGlwV1krNk5WQSt3cHJjOGNQMU5NUmRZM1VkeWhqNjVBVm1yRzBoNTVmekZSWTRzOXVETUVKRFI3Um9HU05wbTgxZlRCME5ZTnBEd3NwYTVRZEU2aTJxM3ZGTzU1bW04V0xEa0UvejVaWDJYOUxSNHdZK0tnWm14LzlpNlZCazk5b3ZrNTEyeFpyeEZNWDBEYUJXRW1hQ2dXWnZoWm9NMWFkQ1Q1cnF6WktueFpzVDU4bjlPWnVTREJobURWSUdJU0dzUEk4VU1TbTV2RGtpNXdTbG1hV1gzb2x2MnV0RDNlcGtOeG4rSmpHbjFyLytuOWdmWkVzcmRSNldCbzhoVm1vZ3VHWkRXNGpEQzFRelFhdzlRNkY4ZVZPeUpaNGtjbDZLY0Jpd0tIakI2Wis2akpUZzJLSFExQ2Mya3AweHovTVZFelZCMk1xQ2I5L2pHc2VEL1RlKzh6dWJSc09FS0lpOFhkck4xbWp5ZFJVbGV3WXVnQktXdVEwM2s1Vlg0Ry9JNHo2TVRVdkdsNUpwdjVTMGRPVnBONGQxSm1lZkRISCt4a052bGVaMGxBVld3d28wNmJjc2FkNnZzTnkzU2pKZ3RUZm5zZGM2NjdCa0hsRk5URXZCd2F0OUtuTWMrTmRJMzRlcHpwcm9iMkxBRTRyUEliOE5XWUVpWDRSaDhobDBkWDhLZE00aHQvYmYxc3J2OG5kY2NobHUwazl6Q0ZZZkRSWWF6YjdSd2Q1RTdvZGhDOVdpZS9mVTFLU2l3WUdaN3lvcGkvWnpQcm0yTXdBRENqMktEM0JLVXhORnB1ZzgwcnBLdzkwajYiLCJkYXRha2V5IjoiQVFFQkFIaWpFRlhHd0YxY2lwVk9hY0c4cVJtSm9WQlBheThMVVV2VThSQ1ZWMFhvSHdBQUFINHdmQVlKS29aSWh2Y05BUWNHb0c4d2JRSUJBREJvQmdrcWhraUc5dzBCQndFd0hnWUpZSVpJQVdVREJBRXVNQkVFREZ5NlhHSFJXcExkZ04yaGxnSUJFSUE3VXdqZWUvc0d5MU9iUjJiVWVjNmRvTUJ2Q2YrOG12WHJwMXRwd2ZjRVBaa2Fybyt2VW1DSDdFK3h6b2pOWTc2RC81bEpTSjhzR2U5N1NwQT0iLCJ2ZXJzaW9uIjoiMiIsInR5cGUiOiJEQVRBX0tFWSIsImV4cGlyYXRpb24iOjE3MTQxMzY5NTd9"
        }
        ports = ["http", "https"] # exposes, publishes these ports in docker AND adds env variables NOMAD_PORT_http NOMAD_PORT_https
      }
    }
  }
}