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
    SYMFONY_APP_PATH with the root location of your symfony application
    SYMFONY_CACHE_DIR with the root dor for symfony cache (change this to "/tmp" when using VM for performance reasons)
 
    
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

**PgAdmin web interface access**

* Access http://pgadmin.postgres.local

** Login: root@localhost
** Password: root

**PostgreSQL access (from PgAdmin interface)**

** Server: postgres
** Port: see POSTGRES_PORT_TO_EXPOSE in the .env file
** User: web 
** Password: web 
** Database: web

**PostgreSQL access (from outside of docker/vagrant)**

** Server: localhost
** Docker Port: see POSTGRES_PORT_TO_EXPOSE in the .env file
** Vagrant Port: 5432
** User: web 
** Password: web 
** Database: web

**Accessing PHP Applicatioin web interface**

* Url: http://phpapp.postgres.local

**Accessing PHP Allication CLI shell**
`````
cd /YOUR_PROJECT_DIRECTORY/docker
docker-compose exec phpapp bash
`````


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

