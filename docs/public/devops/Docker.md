---
tags:
  - devops
  - docker
  - container
---

# Docker

DevOps: Docker registry Basic Authentication and HTTPS

![Docker](https://miro.medium.com/max/406/1*8uXBBUlyJePLINh-xPzlJQ.jpeg)

There are two links for handling insecure and docker’ notices about different solutions although we proposed a secure registry so it is better to know a little bit of another information. (Registry, Insecure)

````ufw allow http
ufw allow https
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -apt-key fingerprint 0EBFCD88
apt install ca-certificates curl openssh-server ufw apt-transport-https -y
apt update
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository “deb [arch=amd64] https://download.docker.com/linux/ubuntu\$(lsb_release -cs) \stable” ```
apt-get install docker-ce docker-ce-cli containerd.io
usermod -aG docker linuxusername
usermod -aG docker root
docker run hello-world
docker ps -a
docker pull registry:2
(optional)reboot
*docker run — entrypoint htpasswd registery:2 -Bbn dockerregistry dockerregistery > auth/htpasswd
*docker run -d -p 5000:5000 — restart=always — name registry -v /opt/auth:/auth -e “REGISTRY_AUTH=htpasswd” -e “REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm” -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd -v /opt/certs:/certs -v /opt/data:/var/lib/registry -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/server.crt -e REGISTRY_HTTP_TLS_KEY=/certs/server.key registry:2
*curl -kiv -H “Authorization: Basic $(echo -n “dockerregistry:dockerregistry” | base64)” https://localhost:5000/v2
*docker login localhost:5000
*docker pull nginx:latest
````

Good luck :face_with_cowboy_hat:
