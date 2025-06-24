#!/bin/bash
##Run Worker
sed -i '16s/"database"/"localhost"/' main.js #cambiar el hostname de la base de datos
sed -i '72s/"redis"/"localhost"/' main.js #cambiar el hostname de la base de datos
npm install
npm start