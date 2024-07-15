variable "proxmox_url" {
  type = string
  default = "https://127.0.0.1:8006"
}
variable "proxmox_username" {
  default = "user"
  type = string
}
variable "proxmox_password" {
  type = string
  default = "password"
}


variable "vmname" { 
  type = map (object({
    name            = string 
    template        = string
    memory          = number
    disk            = number
    storage         = string
    cnt             = number
    username        = string
    password        = string
    ssh_key         = list(string)
#    ip_address = list(string)
}))

default = {
  specs1 = {
    cnt         = 3 
    name        = "debian12"
    disk        = 5
    memory      = 3092
    storage     = "vms"
    template    = "debian-12"
    username    =  "terraform"
    password    =  "terraform"
    ssh_key     = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcSuu2X8Q5TwXyOKodNcJtQit5m8UfR+6rdOH9SeyJSguXwWesw8EF+mrEoTnlwBa/oe4IkxVJ6z/ahbiyreDb7XVcs8m5AUA+oN9fy7pGP7T97xT3gUSsHJWw/ugQMe1CcP5JO5/pQ/7QUEoGNddku/07uBjLEJ5GwtdAUYqsfBYlLLswg+5pkE/yOCKM0/pDags0Td6plM1t49RcU9siIGs3eTILy+DqKUmJoQUM4QxHMAMEAj2+GOer01oEofT3Dbt4kA7FVZhFtOlJLSS/vfsEpnegRGsA4qfMXItAFQzxBjxEgCIUF9pZJbtYdquL5fAVYAv0up8fKK6yluTDYud/i2WarP7SF5Y7Ak4PqnQSJAIt0IEBA3RG1FOG0cuGiWjaQ+qm8+dT7BsoLY6oRXwt1ggCtg/gBRsMNjXCXU/CnGeZA0OLVdOgL4PLBJX49hNCXcBFg7n1aUh0CA6Ceo34b//Iy952bl7C4CEfDPqUzxiKEWW/q2OaTAi8pZc= root@pve",
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+xHFiyPm65dqXL8wFoAW3SkxRwtOjeRl/LaCQlmFwcZnSESmuUV58aJK3g71P+RolyD5dAxk19mNyE3SPZ3izAxicOW5TMWLni29KuOJX/MnutP/T5PXTTiq56b385X5Ryg9Wr2ZBF4q2wxv+dhp7WIbnkvfy2jmkyCHsIas/VW4lYAUofx5anHt8ZRk0Y/jkzlRc1fz+Lpf98gpXHh9kKrFDi/UagwEfIzx6NZ0PPZh87eDqeBh2+2EVoyTMNYUVioM2+QbmC16pyxkh4866+krS3XTDhIKsdPwZjYcerIHVRV+7fiUlgBIFR53WQWkL2W+Q8Vv9Lp62SmFNe2VffaqwUOl1gOmOPFaIM/GU4Z4cXVGEz9FMpaV0AwW0lq9EH8MX//GgNqCSbwe0L3p+ZJHp8gadN16fe6gvm5e8VkJ7iLTfnJXRh4XaNjUEPyP9DZqdsgqBij0veEhZiqEw7qq/qrdIhGru4Wv1QPn425+bQ4YA8nliAUca1hhMO28= terraform-test"
    ]
#    ip_address = ["192.168.110.50"]
  },
  CentOS-7-ssh = {
    name = "CentOS-7-ssh"
    memory = 2048
    template = ""
    net_mac_address = "B4:1B:2D:1A:B2:4A"
    disk = 10
    storage = "vms"
    cnt = 3 
    username    =  "terraform"
    password    =  "terraform"
    ssh_key     = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcSuu2X8Q5TwXyOKodNcJtQit5m8UfR+6rdOH9SeyJSguXwWesw8EF+mrEoTnlwBa/oe4IkxVJ6z/ahbiyreDb7XVcs8m5AUA+oN9fy7pGP7T97xT3gUSsHJWw/ugQMe1CcP5JO5/pQ/7QUEoGNddku/07uBjLEJ5GwtdAUYqsfBYlLLswg+5pkE/yOCKM0/pDags0Td6plM1t49RcU9siIGs3eTILy+DqKUmJoQUM4QxHMAMEAj2+GOer01oEofT3Dbt4kA7FVZhFtOlJLSS/vfsEpnegRGsA4qfMXItAFQzxBjxEgCIUF9pZJbtYdquL5fAVYAv0up8fKK6yluTDYud/i2WarP7SF5Y7Ak4PqnQSJAIt0IEBA3RG1FOG0cuGiWjaQ+qm8+dT7BsoLY6oRXwt1ggCtg/gBRsMNjXCXU/CnGeZA0OLVdOgL4PLBJX49hNCXcBFg7n1aUh0CA6Ceo34b//Iy952bl7C4CEfDPqUzxiKEWW/q2OaTAi8pZc= root@pve",
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCWF4Qsx0Qr3OPchKC+e+D5gBRrFDfyjFuEETQB5/T00IN06zhQFMWHK+RZqi/YeNplJ1Oh3EvssnP1bCmBMW8BWezZFeSZTcwxHDE4a68SOYo5FHzT49K/7kCoTFJ/1MI7w798fDzw0tCruelwSlE3dzuK9iZDqG34Mt3yYYpk72d2b9cKocxNcTny3cOMDlhCpL6TZkr+xmqe0eUu80L32Mc0Kqi5DYDGf0Tr2mCCwCwjJyZA23fm1xug7ULWxOiiaJ2cCdlWfT9PJf73Qy962LP5UDBnWN2PkJjbuZUjgdy9tOlVAZxKCyBny8sp2eTbN78dm43es2ggHYugBdrtqT2HY6HNGvAAlp7WfKG7lHjOToAnee4gr8ouWAfOCIgQq/vjwBLQ1ZVF6FQnKWHtUK+dU9HSupu5zCg41j9WrnlfB3Av9OElPnDfCEmiM8kpu/KTXK1+sJJeSbYZSQX/KVNpXPOz0bTwuV7rXInCoDYVEGHxJgVSBaFbLQDKgW0="
    ]
#    ip_address = ["192.168.110.50"]
  }
}
}
