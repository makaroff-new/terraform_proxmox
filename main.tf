terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url  = "${var.proxmox_url}"
    pm_password = "${var.proxmox_password}"
    pm_user     = "${var.proxmox_username}"
    pm_otp = ""
}

resource "proxmox_cloud_init_disk" "ci" {
  for_each = var.vmname
  name      = each.value["name"]
  pve_node  = "pve"
  storage   = "local"

  meta_data = yamlencode({
    instance_id    = sha256(each.value["name"])
    local-hostname = each.value["name"]
  })


  user_data = join("\n",["#cloud-config", 
  yamlencode({
    groups = [
      "sudo"      
    ],
    users = ["default",
    {
      name              = each.value["username"]
      sudo              = "ALL=(ALL) NOPASSWD:ALL"
      lock_passwd       = false
      passwd          = each.value["passwd"]
      shell             = "/bin/bash"
      ssh_authorized_keys = [
        for s in each.value["ssh_key"] : s
          ]
    }
    ]
})
])


network_config = yamlencode({
  network = {
    version = 2
    ethernets = {
            id0 = {
                match = {
                    name = "ens*"
                }
                wakeonlan = true
                dhcp4 = true
            }
        }
    }
  
})

}

resource "proxmox_vm_qemu" "pxe-example" {
    for_each = var.vmname
    name  = each.value["name"]
    clone = each.value["template"]
    agent                     = 1
    automatic_reboot          = true
    balloon                   = 0
    bios                      = "seabios"
    cores                     = 2
    cpu                       = "host"
    define_connection_info    = true
    force_create              = false
    hotplug                   = "disk,usb,network"
    kvm                       = true
    memory                    = each.value["memory"]
    numa                      = false
    onboot                    = true
    vm_state                  = "running"
    qemu_os                   = "l26"
    scsihw                    = "virtio-scsi-pci"
    sockets                   = 1
    protection                = false
    tablet                    = true
    target_node               = "pve"
    vcpus                     = 0
    full_clone                = false
    os_type  = "cloud-init"
#    cloudinit_cdrom_storage = "local-lvm"
    disks {
 scsi {
      scsi0 {
        cdrom {
          iso = "${proxmox_cloud_init_disk.ci["${each.value["name"]}"].id}"
        }
      }
    }
        virtio {
            virtio0 {
                disk {
                    backup             = false
                    cache              = "writeback"
#                    discard            = true
#                    emulatessd         = true
#                    iothread           = true
                    size               = each.value["disk"]
                    storage            = each.value["storage"]
                }
            }
        }
    }

    network {
        bridge    = "vmbr0"
        firewall  = false
        link_down = false
        model     = "virtio"
    }

    smbios {
        family       = "VM"
        manufacturer = "Hashibrown"
        product      = "Terraform"
        sku          = md5(each.value["name"])
        # uuid         = "5b710d2f-4ea2-4d49-9eaa-c18392fd734d"
        version      = "v1.0"
        serial       = "ABC123"
    }
    
    #ipconfig0 = "ip=dhcp"
    #ipconfig1 = "ip=192.168.100.31/24,gw=192.168.100.1"
}
