# Java

## Jvm settings for remote jmx

```bash
 -Dcom.sun.management.jmxremote.port=45921 -Dcom.sun.management.jmxremote.rmi.port=45921 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1
```

## Import cert to keystore

```bash
echo | openssl s_client -connect server:port 2>&1 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > yourcert.pem

./keytool.exe -keystore cacerts -importcert -alias alias -file yourcert.pem

default password (changeit)
```
