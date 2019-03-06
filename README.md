**Prerequisites (Linux + docker only)**

* Make sure you resolve pgadmin.postgres.local as 127.0.0.1  

````
echo "127.0.0.1 pgadmin.postgres.local" >> /etc/hosts
````

**Set-up docker application environment**

Create new .env file, copy content from .env.dist

````
cd /YOUR_PROJECT_DIRECTORY/docker
cp .env.dist .env
````

Edit docker/.env and replace: 

    NGINX_PORT_TO_EXPOSE with the port you want to expose
    POSTGRES_PORT_TO_EXPOSE with the port you want to expose 
    
In case of conflicts with the local environment it is suggested to change port mapping of nginx and postgresql to different 
than default.    


**Setting up local vagrant environment (Windows only)**

Step 1: Install Virtualbox (https://www.virtualbox.org/)

Step 2: Install vagrant (https://www.vagrantup.com/)

Step 3: Install vagant plugins
`````
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
`````
 
Step 4: Launch Vagrant Box

`````
cd vagrant
vagrant box update
vagrant up 
vagrant ssh
`````

**Accessing database with the dockerized PgAdmin**

* Access http://pgadmin.postgres.local

  Server: postgres

  User: web 
  
  Password: web 

  Database: web


**Starting docker application**
`````
cd /YOUR_PROJECT_DIRECTORY/docker 
./start_containers.sh
`````

**Stopping docker application**
`````
cd /YOUR_PROJECT_DIRECTORY/docker
./stop_containers.sh
`````

**Rebuilding docker application**
`````
cd /YOUR_PROJECT_DIRECTORY/docker
./stop_containers.sh
`````

