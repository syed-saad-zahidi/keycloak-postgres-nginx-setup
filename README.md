## KeyCloak-Production setup using docker compose
[Documentation](https://www.keycloak.org/guides#getting-started)
## Prerequisite
* Docker software should be installed on host
  * Copy and Run [docker-ubuntu.sh](../docker-installation/docker-ubuntu.sh) file to install docker and create `distro` ubuntu user
* Either use docker volume or host relative path to store permanent volume of database
* Get a domain with access to update record,
## Obtain SSL Certificate using Certbot:
Install Certbot and obtain an SSL certificate for your domain. make sure your host should accessible from internet
```shell
  # Install Certbot 
  # Please note if you executed ../docker-installation/docker-ubuntu.sh then certbot is already installed so you can skip below installation script
  sudo apt-get update
  sudo apt-get install certbot

  # Obtain SSL certificate
  # sudo certbot certonly --standalone -d <Keycloak server domain> -m <your email> --agree-tos
  sudo certbot certonly --standalone -d keycloak-dev.abc.com -m test@gamil.com --agree-tos
```
## Clone https://github.com/syed-saad-zahidi/keycloak-postgres-nginx-setup repo
```
git clone https://github.com/syed-saad-zahidi/keycloak-postgres-nginx-setup
```
## Before Running docker compose changes must be done set-env.sh file run the same
```shell
# update below property as per setup
export KC_HOSTNAME_URL=https://keycloak-dev.abc.com
export POSTGRES_USER=XXXX
export POSTGRES_DB=XXXX
export POSTGRES_PASSWORD=XXXX
export KEYCLOAK_FRONTEND_URL=https://keycloak-dev.abc.com/auth
export KEYCLOAK_HOSTNAME=keycloak-shiv.duckdns.org

# After updating set-env.sh file then just execute on host
source ./set-env.sh
```
Check below property for nginx.conf and update correct server host 
```config
server_name keycloak-dev.abc.com;
ssl_certificate "/etc/letsencrypt/live/keycloak-dev.abc.com/fullchain.pem";
ssl_certificate_key "/etc/letsencrypt/live/keycloak-dev.abc.com/privkey.pem";
```

## Running keycloak server
```shell
  cd keycloak-setup
  docker compose up -d
```
#### Default credential for keycloak server check env I am using below
```yaml
KEYCLOAK_ADMIN: admin
KEYCLOAK_ADMIN_PASSWORD: Password123
```
