## **Desafío Final Semana 1**
🧪 **Ejecutá la App de Votación en tu Entorno Local**

🎯 **Objetivo Original**
Poner en marcha Roxs Voting App, una aplicación de votación distribuida que te permitirá aplicar conceptos de Linux, scripting, automatización con Ansible y máquinas virtuales con Vagrant.

🎯 **Resultado Esperado**
App funcional en entorno local
Automatización básica de dependencias
Experiencia práctica de orquestar servicios sin Docker (aún)

💡 **Bonus**
Creá un script llamado iniciar_app.sh que levante todos los servicios

---

🔥 **Ir mas alla!**
Como parte del desafio de la primer semana 
* La ejecucion de las aplicaciones correran dentro de una VM con hypervisor Proxmox.
* Se usara Terraform como IaC para crear la VM con el provider Telmate.
* Se utiliza el provider de Cloudflare y se agregaron 2 registros de tipo CNAME para exponer las apps hacia Internet con TLS:
     * vote.chicho.com.ar
     * result.chicho.com.ar
* Para guardar y almacenar el archivo `terraform.tfstate` se utilizo Terraform Cloud 
* Se utliza Ansible para la instalacion de Redis, Postgres, NodeJs y Python.
* Se creo un Script llamado `iniciar_apps.sh` que corre en el playbook de Ansible para iniciar los servicios.

---

![Mapa de la arquitectura](/docs/mapa_arquitectura.png)

---

✅ **Requisitos**

* Terraform
* Ansible
* Una cuenta en Terraform Cloud para crear un nuevo proyecto y almacenar el file state
* Hipervisor Proxmox
* Nginx Proxy Manager
* Dominio en Cloudflare para cargar registros

🛠️ **Pasos para correr las aplicaciones**

**Terraform:**

1 - Crear el archivo terraform.tvfars

```
##Definimos las variables para proxmox
pm_api_url              = "https://<ip_proxmox>:8006/api2/json"
cloudinit_template_name = "ubuntu-2204-cloudinit-template"
proxmox_node            = "pve"
ssh_key                 = "<ssh_public_key>"
pm_api_token_id         = "terraform_user@pve!token_id"
pm_api_token_secret     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxx"
pm_user                 = "terraform_user@pve"
##Variables de Cloudflare
zone_id                 = "<zone_id>"
account_id              = "<account_id>"
cloudflare_api_token    = "<token>"
```

2- Logearse en Terraform Cloud por CLI
* Necesario para poder almacenar el state.
```
$ terraform login
```
![tflogin](/docs/terraformlogin.png)

3 - Iniciar el directorio de trabajo, visualizar el plan y aplicarlo.

```
$terraform init
$terraform plan
$terraform apply
```

**Ansible**

* Dentro del directorio Ansible correr el playbook.

```
ansible-playbook -i hosts playbooks/install-apps.yaml
```

El playbook de Ansible realiza las siguientes tareas:

* Actualiza repositorios de paquetes
* Instala Redis, Postgres, Python y NodeJS
* Copia los Scripts dentro del host que se creo
* Ejecuta los scripts

🚀 **Resultado Esperado**

* App funcional en entorno local
* Automatización básica de dependencias
* Experiencia práctica de orquestar servicios sin Docker (aún)
* Acceder a las URL para verificar que los servicios estan funcionando.
     * vote.chicho.com.ar
     * result.chicho.com.ar


![Imagen 1](/docs/vote.png) ![Imagen 2](/docs/result.png)