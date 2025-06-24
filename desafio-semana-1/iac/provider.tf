##asignar una variable de tipo cadena para almacenar la URL de la api de Proxmox
variable "pm_api_url" {
  type = string
}

## Variables para Proxmox
variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "pm_user" {
  type = string
}

## Variables para Cloudflare
variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}


## Le decimos a terraform que vamos a usar el provider de Telmate para proxmox
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc01"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

##Configuramos la url de proxmox  de la API del provider
provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_user             = var.pm_user
  pm_debug            = true
  pm_tls_insecure     = true  # ← Esto desactiva la verificación SSL
}

##Configuramos la API del provider de Cloudflare
provider "cloudflare" {
  # token pulled from $CLOUDFLARE_API_TOKEN
  api_token = var.cloudflare_api_token
}
