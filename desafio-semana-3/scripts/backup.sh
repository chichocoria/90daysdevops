#!/bin/bash
docker exec -t desafio-semana-3_database_1 pg_dumpall -c -U postgres | gzip > dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql.gz
echo "✅ Backup completado"