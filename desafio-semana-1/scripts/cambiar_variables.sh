#!/bin/bash
##Run Worker
sed -i '16s/"database"/"localhost"/' worker/main.js #cambiar el hostname de la base de datos
sed -i '72s/"redis"/"localhost"/' worker/main.js #cambiar el hostname de la base de datos
sed -i '8s/3000/8000/' worker/main.js #cambiar puerto
cd worker
npm install
npm start &

cd ~/roxs-devops-project90/roxs-voting-app/

##Run frontend vote
sed -i '92s/'database'/'localhost'/' vote/app.py
sudo apt install python3.10-venv -y
cd vote
python3.10 -m venv .venv
source .venv/bin/activate
sudo apt-get install -y python3-psycopg2
sudo pip install -r requirements.txt
sudo nohup python3.10 app.py &

cd ~/roxs-devops-project90/roxs-voting-app/

##Run backend result
##Run backend result
sed -i '94s/'database'/'localhost'/' result/main.js
cd result
npm install
npm start &



