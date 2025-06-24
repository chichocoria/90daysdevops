sudo apt update
sudo apt upgrade

Redis:
sudo apt-get install lsb-release curl gpg -y && \
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list && \
sudo apt-get update && \
sudo apt-get install redis -y && \
sudo systemctl enable redis-server && \
sudo systemctl start redis-server

Postgres:
sudo apt install postgresql -y && \
sudo systemctl start postgresql.service

Install NodeJS:
sudo apt install nodejs npm -y

Pyhton:
sudo apt install python3-pip -y

Clonar repo:
git clone https://github.com/roxsross/roxs-devops-project90.git
cd roxs-devops-project90

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
##Script cambios en la db



##Correr apps

Worker:
npm install

