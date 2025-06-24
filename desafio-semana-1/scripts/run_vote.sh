#!/bin/bash
##Run frontend vote
sed -i '92s/'database'/'localhost'/' app.py
sudo apt install python3.10-venv -y
python3.10 -m venv .venv
source .venv/bin/activate
sudo apt-get install -y python3-psycopg2
sudo pip install -r requirements.txt
sudo python3.10 app.py
