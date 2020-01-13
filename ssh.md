# SSH

## Local port forwarding

```bash
ssh -L<local port>:localhost:<remoteport>  <user>@<remote_server>
```

## Copy id_rsa.pub to remote server authorized_keys

```bash
ssh-copy-id user@remote_server
```
