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
