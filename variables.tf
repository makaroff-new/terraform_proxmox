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
    username        = string
    passwd        = string
    ssh_key         = list(string)
#    ip_address = list(string)
}))

default = {
  debian-01 = {
    name        = "debian-01"
    disk        = 10
    memory      = 4096
    storage     = "vms"
    template    = "debian-12"
    username    =  "terraform"
    passwd    =  "$6$dEAft1YtsvRGAwkN$b11yTiftfinqBFPfqKgSAOkpLYBX0LodKONtWgco8lS0cOLGjqPnY3qxCgCBszIzyxnF95RHXdmxgrE4cWv.p."
    ssh_key     = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcSuu2X8Q5TwXyOKodNcJtQit5m8UfR+6rdOH9SeyJSguXwWesw8EF+mrEoTnlwBa/oe4IkxVJ6z/ahbiyreDb7XVcs8m5AUA+oN9fy7pGP7T97xT3gUSsHJWw/ugQMe1CcP5JO5/pQ/7QUEoGNddku/07uBjLEJ5GwtdAUYqsfBYlLLswg+5pkE/yOCKM0/pDags0Td6plM1t49RcU9siIGs3eTILy+DqKUmJoQUM4QxHMAMEAj2+GOer01oEofT3Dbt4kA7FVZhFtOlJLSS/vfsEpnegRGsA4qfMXItAFQzxBjxEgCIUF9pZJbtYdquL5fAVYAv0up8fKK6yluTDYud/i2WarP7SF5Y7Ak4PqnQSJAIt0IEBA3RG1FOG0cuGiWjaQ+qm8+dT7BsoLY6oRXwt1ggCtg/gBRsMNjXCXU/CnGeZA0OLVdOgL4PLBJX49hNCXcBFg7n1aUh0CA6Ceo34b//Iy952bl7C4CEfDPqUzxiKEWW/q2OaTAi8pZc= root@pve",
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+xHFiyPm65dqXL8wFoAW3SkxRwtOjeRl/LaCQlmFwcZnSESmuUV58aJK3g71P+RolyD5dAxk19mNyE3SPZ3izAxicOW5TMWLni29KuOJX/MnutP/T5PXTTiq56b385X5Ryg9Wr2ZBF4q2wxv+dhp7WIbnkvfy2jmkyCHsIas/VW4lYAUofx5anHt8ZRk0Y/jkzlRc1fz+Lpf98gpXHh9kKrFDi/UagwEfIzx6NZ0PPZh87eDqeBh2+2EVoyTMNYUVioM2+QbmC16pyxkh4866+krS3XTDhIKsdPwZjYcerIHVRV+7fiUlgBIFR53WQWkL2W+Q8Vv9Lp62SmFNe2VffaqwUOl1gOmOPFaIM/GU4Z4cXVGEz9FMpaV0AwW0lq9EH8MX//GgNqCSbwe0L3p+ZJHp8gadN16fe6gvm5e8VkJ7iLTfnJXRh4XaNjUEPyP9DZqdsgqBij0veEhZiqEw7qq/qrdIhGru4Wv1QPn425+bQ4YA8nliAUca1hhMO28= terraform-test"
    ]
#    ip_address = ["192.168.110.50"]
  },
  Ubuntu2404-01 = {
    name        = "Ubuntu2404-01"
    disk        = 10
    memory      = 4096
    storage     = "vms"
    template    = "ubuntu-2404"
    username    =  "terraform"
    passwd    =  "$6$dEAft1YtsvRGAwkN$b11yTiftfinqBFPfqKgSAOkpLYBX0LodKONtWgco8lS0cOLGjqPnY3qxCgCBszIzyxnF95RHXdmxgrE4cWv.p."
    ssh_key     = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcSuu2X8Q5TwXyOKodNcJtQit5m8UfR+6rdOH9SeyJSguXwWesw8EF+mrEoTnlwBa/oe4IkxVJ6z/ahbiyreDb7XVcs8m5AUA+oN9fy7pGP7T97xT3gUSsHJWw/ugQMe1CcP5JO5/pQ/7QUEoGNddku/07uBjLEJ5GwtdAUYqsfBYlLLswg+5pkE/yOCKM0/pDags0Td6plM1t49RcU9siIGs3eTILy+DqKUmJoQUM4QxHMAMEAj2+GOer01oEofT3Dbt4kA7FVZhFtOlJLSS/vfsEpnegRGsA4qfMXItAFQzxBjxEgCIUF9pZJbtYdquL5fAVYAv0up8fKK6yluTDYud/i2WarP7SF5Y7Ak4PqnQSJAIt0IEBA3RG1FOG0cuGiWjaQ+qm8+dT7BsoLY6oRXwt1ggCtg/gBRsMNjXCXU/CnGeZA0OLVdOgL4PLBJX49hNCXcBFg7n1aUh0CA6Ceo34b//Iy952bl7C4CEfDPqUzxiKEWW/q2OaTAi8pZc= root@pve",
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+xHFiyPm65dqXL8wFoAW3SkxRwtOjeRl/LaCQlmFwcZnSESmuUV58aJK3g71P+RolyD5dAxk19mNyE3SPZ3izAxicOW5TMWLni29KuOJX/MnutP/T5PXTTiq56b385X5Ryg9Wr2ZBF4q2wxv+dhp7WIbnkvfy2jmkyCHsIas/VW4lYAUofx5anHt8ZRk0Y/jkzlRc1fz+Lpf98gpXHh9kKrFDi/UagwEfIzx6NZ0PPZh87eDqeBh2+2EVoyTMNYUVioM2+QbmC16pyxkh4866+krS3XTDhIKsdPwZjYcerIHVRV+7fiUlgBIFR53WQWkL2W+Q8Vv9Lp62SmFNe2VffaqwUOl1gOmOPFaIM/GU4Z4cXVGEz9FMpaV0AwW0lq9EH8MX//GgNqCSbwe0L3p+ZJHp8gadN16fe6gvm5e8VkJ7iLTfnJXRh4XaNjUEPyP9DZqdsgqBij0veEhZiqEw7qq/qrdIhGru4Wv1QPn425+bQ4YA8nliAUca1hhMO28= terraform-test"
    ]
#    ip_address = ["192.168.110.50"]
  }
}
}
