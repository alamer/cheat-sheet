# Nginx

## Reload setting

```bash
nginx -s reload
```

## Configuration

```bash
/etc/nginx
```

### Proxy pass

```conf
location /api {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP        $remote_addr;
    proxy_set_header X-Forwarded-Host $host:$server_port;
    proxy_set_header X-Forwarded-Server $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_pass http://127.0.0.1:8080/api;
}
```

### Deny by IP

```conf
location /monitor {
    proxy_pass http://127.0.0.1:9000/monitor;
    allow 192.168.0.10;
    allow 192.168.0.20;
    deny all;
}
```

### Create self-signed wildcard cert
``` bash
openssl genrsa 4096 > node1.key
openssl req -new -x509 -nodes -sha1 -days 3650 -key node1.key -subj "/C=JO/CN=*.eq0.ru"> node1-wildcard.cert
cat node1-wildcard.cert node1.key > node1-wildcard.pem
chmod 644 node1.key node1-wildcard.pem
mkdir /etc/nginx/ssl
cp node1.key node1-wildcard.pem  /etc/nginx/ssl
vim /etc/nginx/conf.d/ssl.conf

server {
  listen 443 ssl;
	server_name *.eq0.ru;

	ssl_certificate      /etc/nginx/ssl/node1-wildcard.pem;
	ssl_certificate_key  /etc/nginx/ssl/node1.key;
	ssl_session_timeout  5m;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Request-ID $request_id;
        proxy_set_header X-Remote-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Upgrade $http_upgrade;
        proxy_cache_bypass $http_upgrade;
    }
}
```