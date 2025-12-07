# Proxy Configuration for Docker

This guide explains how to configure Docker to work behind the IIT Delhi proxy.

## Setting up proxy for Docker Client

Create a file in the path `~/.docker/config.json` with the following contents:

```json
{
 "proxies":{
  "default":{
   "httpProxy": "http://10.10.78.61:3128",
   "httpsProxy": "http://10.10.78.61:3128",
   "noProxy": "127.0.0.0/8"
  }
 }
}
```

## Setting up proxy for Docker Deamon

Create a file in the path `/etc/systemd/system/docker.service.d/http-proxy.conf` with the following contents:

```conf
[Service]
Environment="HTTP_PROXY=http://proxy61.iitd.ac.in:3128"
Environment="HTTPS_PROXY=http://proxy61.iitd.ac.in:3128"
Environment="NO_PROXY=localhost,127.0.0.1,"
```

- Restart the systemctl deamon and docker service:

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```
