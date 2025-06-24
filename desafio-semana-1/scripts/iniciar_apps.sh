#!/bin/bash
set -e  # Detiene el script si algún comando falla

## Configuración
WORKER_DIR=~/roxs-devops-project90/roxs-voting-app/worker
VOTE_DIR=~/roxs-devops-project90/roxs-voting-app/vote
RESULT_DIR=~/roxs-devops-project90/roxs-voting-app/result
LOG_DIR=~/roxs-devops-project90/logs

mkdir -p "$LOG_DIR"

echo "[INFO] Iniciando Worker..."
sed -i '16s/"database"/"localhost"/' "$WORKER_DIR/main.js"
sed -i '72s/"redis"/"localhost"/' "$WORKER_DIR/main.js"
sed -i '8s/3000/8000/' "$WORKER_DIR/main.js"
cd "$WORKER_DIR"
npm install
nohup node main.js > "$LOG_DIR/worker.log" 2>&1 &

echo "[INFO] Iniciando Frontend Vote..."
sed -i "92s/'database'/'localhost'/" "$VOTE_DIR/app.py"
sudo apt install -y python3.10-venv python3-psycopg2
cd "$VOTE_DIR"
python3.10 -m venv .venv
source .venv/bin/activate
sudo pip install -r requirements.txt
sudo pip install flask
sudo nohup python3.10 app.py > "$LOG_DIR/vote.log" 2>&1 &

echo "[INFO] Iniciando Backend Result..."
sed -i '94s/"database"/"localhost"/' "$RESULT_DIR/main.js"
cd "$RESULT_DIR"
npm install
nohup node main.js > "$LOG_DIR/result.log" 2>&1 &

echo "[INFO] Todas las aplicaciones han sido lanzadas en segundo plano."