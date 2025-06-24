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
* Se va a ejecutar la aplicacion en un VM con  hypervisor Proxmox.
* Se utilizo Terraform como IaC para crear la VM con el provider Telmate.
* Se utilizo el provider de Cloudflare y se agregaron 2 registros de tipo CNAME para exponer las apps hacia Internet con TLS:
     * vote.chicho.com.ar
     * result.chicho.com.ar
* Para guardar y almacenar el archivo `terraform.tfstate` se utilizo Terraform Cloud 
* Se utlizo Ansible para la instalacion de Redis, Postgres, NodeJs y Python.
* Se utilizo un Script llamado `iniciar_apps.sh` que corre en el playbook de Ansible para iniciar los servicios.

---

