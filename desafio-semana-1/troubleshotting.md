al correr terraform apply daba el siguiente error:

╷
│ Error: error creating Guest: 403 Permission check failed (/sdn/zones/localnetwork/vmbr0, SDN.Use), error status: {"message":"Permission check failed (/sdn/zones/localnetwork/vmbr0, SDN.Use)\n","data":null} (params: map[full:true name:desafio-semana-1 newid:106 target:pve])
│ 
│   with proxmox_vm_qemu.desafio-semana-1[0],
│   on main.tf line 20, in resource "proxmox_vm_qemu" "desafio-semana-1":
│   20: resource "proxmox_vm_qemu" "desafio-semana-1" {
│ 
╵
Releasing state lock. This may take a few moments...

**Solucion***
Desde el shell de proxmox correr el siguiente comando:
```
pveum acl modify / -user terraform_user@pve -role PVESDNUser
```
----