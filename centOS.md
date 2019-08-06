#CentOS

## firewall-cmd

### Close port
```
sudo firewall-cmd --zone=public --remove-port=45921/tcp --permanent
```
```
firewall-cmd --zone=public --remove-port=9000/tcp
firewall-cmd --runtime-to-permanent
firewall-cmd --reload 
```

### Open port
```
sudo firewall-cmd --zone=public --permanent --add-port=8302/udp
sudo firewall-cmd --zone=public --permanent --add-port=8300/tcp
```

###  Reload
```
sudo firewall-cmd --reload
```

### Grant access to port for ip adresses
```
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="10.111.28.170/32"  port protocol="tcp" port="27017" accept'
```


## Swapfile
```
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo nano /etc/fstab
/swapfile   swap    swap    sw  0   0
mount -a
```

## Create sudo user
```
useradd username
passwd username
usermod -aG wheel username
```

## Install jdk
```
alternatives --install /usr/bin/java java /opt/jdk1.8.0_201/bin/java 2
alternatives --config java
```

## Add physical volume to LVM and extend logical volume
```
fdisk /dev/sdb
pvcreate /dev/sdb1
vgextend VG_OtherData /dev/sdb1
lvextend -r -l +100%FREE /dev/VG_OtherData/var
```


## Systemctl search
````
systemctl list-unit-files | grep mongo
```