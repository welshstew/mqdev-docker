# mqdev-docker

Simple thing to get ibmmq up and running on OpenShift.  Using WMQ8 and turning auth off

```
oc new-app https://github.com/welshstew/mqdev-docker --strategy=docker -e LICENSE=accept,MQ_QMGR_NAME=MQ1
```

Download client jars from [https://www-945.ibm.com/support/fixcentral/swg/downloadFixes?parent=ibm~WebSphere&product=ibm/WebSphere/WebSphere+MQ&release=9.0.0.0&platform=All&function=fixId&fixids=9.0.0.0-WS-MQ-JavaVM-LAIT14385&useReleaseAsTarget=true&includeRequisites=1&includeSupersedes=0&downloadMethod=http]

jars:

- com.ibm.mqjms.jar
- com.ibm.mq.jmqi.jar
- com.ibm.mq.allclient.jar


```
mvn install:install-file -Dfile=com.ibm.mqjms.jar -DgroupId=com.ibm -DartifactId=mqjms -Dversion=9.0.0.0 -Dpackaging=jar
mvn install:install-file -Dfile=com.ibm.mq.jmqi.jar -DgroupId=com.ibm.mq -DartifactId=jmqi -Dversion=9.0.0.0 -Dpackaging=jar
mvn install:install-file -Dfile=com.ibm.mq.allclient.jar -DgroupId=com.ibm.mq -DartifactId=allclient -Dversion=9.0.0.0 -Dpackaging=jar

# also need to add those into the nexus.

```

## Nexus config...

My configuration/settings.xml is pointed to my local nexus where I have stuffs.

## Running via docker...

```
docker run --env LICENSE=accept --env MQ_QMGR_NAME=QM2 -it --user=root --rm $MQ_IMAGE_ID bash
```

### Setting up SSL..?

https://www.ibm.com/developerworks/websphere/library/techarticles/0608_vanstone/0608_vanstone.html

https://www.youtube.com/watch?v=MWJb1sQ9um0

```
runmqckm -keydb -create -db mydb -pw password -type jks

runmqakm -cert -create -db /opt/mqm/bin/mydb.jks -pw password -label label -dn cn=self
----

runmqakm -fips -keydb -create -db key.kdb -pw password
runmqakm -fips -cert -create -db key.kdb -dn cn=local -label hello -pw password

-----
runmqckm -cert -create -db wmqca.kdb -pw password -label wmqca -dn " CN=WMQ CA, OU=WMQ, O=RedHat, L=Cardiff, ST=Wales, C=UK" -expire 365

```
