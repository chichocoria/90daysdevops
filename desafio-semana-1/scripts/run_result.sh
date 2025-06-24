#!/bin/bash
##Run backend result
sed -i '94s/'database'/'localhost'/' main.js
npm install
npm start