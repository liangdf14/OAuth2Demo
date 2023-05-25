FROM centos:7.9.2009

ADD . /tmp/demo/

WORKDIR /tmp/demo

RUN yum update -y \
&& yum install -y wget curl git \
&& wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm \
&& rpm -ivh jdk-17_linux-x64_bin.rpm \
&& export JAVA_HOME=/usr/lib/jvm/jdk-17-oracle-x64/ \
&& export PATH=$PATH:$JAVA_HOME/bin \
&& cd /tmp/demo/demo-server \
&& ./gradlew bootJar \
&& cd /tmp/demo/demo-resource \
&& ./gradlew bootJar \
&& cd /tmp/demo/demo-client \
&& ./gradlew bootJar \
&& chmod a+x /tmp/demo/start.sh

EXPOSE 8080 8089 9000

CMD ["./start.sh"]