# SSH

## Local port forwarding
```
ssh -L<local port>:localhost:<remoteport>  <user>@<remote_server>
```

## Copy id_rsa.pub to remote server authorized_keys
```
ssh-copy-id user@remote_server
```