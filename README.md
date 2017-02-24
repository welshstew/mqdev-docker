# mqdev-docker

Simple thing to get ibmmq up and running on OpenShift

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



