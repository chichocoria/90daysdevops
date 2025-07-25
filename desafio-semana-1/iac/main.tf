##Declaramos variables que se van a utilizar en todo momento

##Nombre de la variable del template que creamos en proxmox
variable "cloudinit_template_name" {
  type = string
}

##Nombre del node de proxmox
variable "proxmox_node" {
  type = string
}

##La variable ssh_key alamacena la clave publica ssh, al declarase sensitive no se muesta ni en logs ni en outputs por seguridad
variable "ssh_key" {
  type      = string
  sensitive = true
}

##Se crean 1 VM
resource "proxmox_vm_qemu" "desafio-semana-1" {
  count       = 1
  name        = "desafio-semana-1"
  ciuser      = "darioc"
  target_node = var.proxmox_node
  clone       = var.cloudinit_template_name
  boot        = "order=scsi0"
  full_clone  = "true"
  agent       = 1
  os_type     = "cloud_init"
  memory      = 4096
  scsihw      = "virtio-scsi-pci"

  # Habilitar consola serial
  serial {
    id   = 0
    type = "socket"
  }

  cpu {
    cores = 2
    sockets = 1
  }
  disks {
    scsi {
      scsi0 {
        disk {
          size    = 30
          storage = "local-lvm"
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0  = "ip=192.168.52.110/24,gw=192.168.52.1"
  nameserver = "8.8.8.8"
  sshkeys    = <<EOF
  ${var.ssh_key}
  EOF
}

################################ CLOUDFLARE ###############################

variable "zone_id" {
  default = "var.zone_id"
}

variable "account_id" {
  default = "var.account_id"
}

variable "domain" {
  default = "chicho.com.ar"
}

resource "cloudflare_record" "vote" {
  zone_id = var.zone_id
  name    = "vote"
  value   = "chicho.com.ar"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "result" {
  zone_id = var.zone_id
  name    = "result"
  value   = "chicho.com.ar"
  type    = "CNAME"
  proxied = true
}