# Mongo DB

##  ERROR: Cannot write pid file to /var/run/mongodb/mongod.pid: No such file or directory 

```
mkdir -p  /var/run/mongodb/ 
chown -R  mongod:mongod /var/run/mongodb/
```