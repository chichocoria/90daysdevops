#!/bin/bash

# Script totalmente automático para PostgreSQL (sin prompts de contraseña)
set -e

# 1. Configurar archivo .pgpass para autenticación automática
echo "🔧 Configurando acceso automático..."
echo "localhost:5432:*:postgres:postgres" | sudo tee -a /var/lib/postgresql/.pgpass
sudo chown postgres:postgres /var/lib/postgresql/.pgpass
sudo chmod 600 /var/lib/postgresql/.pgpass

# 2. Configurar contraseña (ejecutando como postgres)
echo "🔑 Estableciendo contraseña..."
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

# 3. Modificar pg_hba.conf
echo "🛠️ Actualizando configuración de autenticación..."
PG_HBA="/etc/postgresql/$(ls /etc/postgresql)/main/pg_hba.conf"
sudo sed -i 's/local   all             postgres                                peer/local   all             postgres                                md5/' "$PG_HBA"

# 4. Reiniciar servicio
echo "🔄 Reiniciando PostgreSQL..."
sudo systemctl restart postgresql

# 5. Crear base de datos 'votes'
echo "🗃️ Creando base de datos..."
sudo -u postgres createdb votes

# 6. Verificaciones finales
echo "🔍 Resultado final:"
sudo -u postgres psql -c "\l" | grep votes
sudo -u postgres psql -d votes -c "SELECT '¡Configuración completada exitosamente!' AS message"

echo -e "\n✅ ¡Todo listo!"
echo "Usuario: postgres"
echo "Contraseña: postgres"
echo "Base de datos: votes"

# 7. Clonar repositorio
git clone https://github.com/roxsross/roxs-devops-project90.git
echo -e "\n✅ ¡Repo listo!"