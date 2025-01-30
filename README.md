   # 🚀 CloudDevOps - 3 tier Application

✨This repository is created to learn and deploy  3-tier application on aws cloud. this project contain three layer Presentation, Application and database

## 🏠 Architecture
![Architecture of the application](architecture.gif)

## Tech stack

- React 
- Nodejs
- MySQL

## 🖥️ Installation of frontend

**Note**: You should have nodejs installed on your system. [Node.js](https://nodejs.org/)

👉 let install dependency to run react application

```sh
cd client
npm install
```

**Note**: you have to change one file for backend API. you will find that `src/pages/config.js`

```sh
vim src/pages/config.js
```

```javascript
// const API_BASE_URL = "http://25.41.26.237:80"; // on live backend server which is running on port 80
const API_BASE_URL = "http://localhost:portNumber";
export default API_BASE_URL;
```
make sure you EDIT above file depends on your scenario


```sh
npm run build 
```

above command creat optimize build of the application in client folder. `build/` you will find all the files that you can serve through **Apache** or **Nginx**
that's the whole setup of the frontend

##  🖥️ ️Installation of backend

**Note**: You should have nodejs installed on your system. [Node.js](https://nodejs.org/)

👉 let install dependency to run Nodejs  API

```sh
cd backend
npm install
```
Now we need to create .env file that holds all the configuration details of the backend. you should be in backend directory

```sh
vim .env
```
add below content 

```javascript
DB_HOST=localhost or URL_of_RDS
DB_USERNAME=user_name_of_MySQL
DB_PASSWORD=passwod_of_my_sql
PORT=3306
```
**Note** : please change above file depending on your setup. like you may use RDS(AWS) or Local mysql-server on your system. your mysql contain database with the name of `test` and it should has `books` table. You can you test.sql to create table 


```sh
mysql -h <<RDS_ENDPOINT OR localhost>> -u <<USER_NAME>> -p<<PASSWORD>>

CREATE DATABASE test;

mysql -h <<RDS_ENDPOINT OR localhost>> -u <<USER_NAME>> -p<<PASSWORD>> test < test.sql
```


please install pm2 if you want to run on cloud. you may need sudo privilages to installed it because we are going to installed globally.

```sh
npm install -g pm2
```

now you can run this application. make sure you are in backend directory


```sh
pm2 start index.js --name "backendAPI"
```

above command will start node server on port 80, you can modify the port number in `index.js` file

✈️ Now we are Ready to see the application

**Thank you so much for reading..😅**

**********************************************************************************************************
front end and backends EC2 insatnce when you Connect: Run these commands
Skip to main content



1.create two pubic "ubuntu" servers in project-vpc    one is for frontend and another one is for backend
2 create rds database in project-vpc
3 copy the rds end point
4.create route 53 private hosted zone with project vpc name is "rds.com"
5. create record  sub domain is book,, select cnamerecord type ,,,, in the value paste your rds end point ,, then create record
6. connect to front end server


---------------------------------- FrontEnd---------------------------------------

-------Step-1-------install dependencies ------
 create shell script file "ex:vi test.sh"
 paste below commands


#!/bin/bash

sudo apt update -y

sudo apt install apache2 -y

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs -y

sudo apt update -y

sudo npm install -g corepack -y     

(#Core modules are built-in libraries that come with the Node.js runtime. They provide essential functionality for various tasks like file handling, HTTP requests, working with stream)

corepack enable

corepack prepare yarn@stable --activate 


#Yarn is a package manager for JavaScript projects, similar to npm (Node Package Manager). It helps developers manage dependencies (libraries and packages) required for their projects. Yarn ensures fast, reliable, and secure dependency management, making it popular among developers.

Why Use Yarn?
Speed: Yarn is optimized for faster dependency installation.
Reliability: Consistent behavior across machines with yarn.lock.


sudo npm install -g pm2


What is PM2?
PM2 (Process Manager 2) is a production-grade process manager for Node.js applications. It helps developers run, monitor, and manage Node.js applications effectively. PM2 is widely used for handling application lifecycle management in production environments, ensuring that your applications stay online, perform well, and recover automatically from crashes.



-- step-2-----------Modifying config.js
then clone your git repo 
   git clone https://github.com/swarnavsgh/3tierApp.git
   
  checkout client cd client 

11. edit the config.js

vi client/src/pages/config.js
  
const API_BASE_URL = "http://www..... com";
 
in above line change to your backend publicip
const API_BASE_URL = "http://publicip";
ex;const API_BASE_URL = "http://32.68.98.10";


------------------------------------------- step-3 ----------- Run 
12. then go to client directory 
13.run below commands

****(Use npm run build:
When preparing the app for deployment (e.g., to a server or hosting service like AWS, Netlify, or Vercel).
Use npm start:
During development or to start the app in production (for backend apps).)*****

npm install 
npm run build
sudo cp -r build/* /var/www/html

your frontend part is completed 





-----------------then connect to backend server---------------------------



----------------- step-1-------
1.create shell script file "ex:vi test.sh"
1.paste below commands

#!/bin/bash

sudo apt update -y

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs -y

sudo apt update -y

sudo npm install -g corepack -y

corepack enable

corepack prepare yarn@stable --activate 

sudo npm install -g pm2


--------------- step-2-------

3.then clone your git repo 
   git clone https://github.com/swarnavsgh/3tierApp.git
   cd backend 
4 edit the .env file in bellow path if u dont have any .env file just create in below path

https://github.com/swarnavsgh/3tierApp.git/backend/.env

### add this mater
DB_HOST=book.rds.com
DB_USERNAME=admin	#cahnge to nyour rds user name 
DB_PASSWORD="admin"   # change to your rds password
PORT=3306



----------- step-3---------
 then run below command in backend directory
  
npm install
npm install dotenv

sudo pm2 start index.js --name "backendApi"


-----------------step-4--------------------------


22. install MySQL in backend server

sudo apt install mysql-server -y




23 in the backend directory use below command to initialize the database 

mysql -h book.rds.com -u admin -p<password> < test.sql

27. now hit your frontend server public ip you will get response 
28. add the books 
project-3tier.txt
Displaying project-3tier.txt.
