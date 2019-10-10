FROM tomcat:8.5.20-jre8-alpine
ENV  CATALINA_HOME /usr/local/tomcat
ENV  PATH ${CATALINA_HOME}/bin:$PATH
RUN mkdir -p "${CATALINA_HOME}"

RUN apk --update add curl ca-certificates tar 
RUN set -x \
    && mkdir /home/mysql \
    && curl -fSL https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz -o /home/mysql/mysql-connector.jar \
    && cd /home/mysql \
    && tar -xzvf mysql-connector.jar \
    && pwd \
    && mkdir -p /usr/share/java \
    && mv /home/mysql/mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar \
    && cd /home \
    && rm -R *

RUN export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar


WORKDIR ${CATALINA_HOME}
ENV TOMCAT_MAJOR 8
LABEL maintainer="alesblaze@gmail.com"



ADD ./target/bookstore-1.war  ${CATALINA_HOME}/webapps/
RUN apk update && \
    apk add mysql-client
#COPY /usr/share/tomcat/conf/tomcat-users.xml usr/local/tomcat/conf/
#RUN sh -c 'touch /usr/local/tomcat/webapps/bookstore-1.war'
EXPOSE 8080
CMD ["catalina.sh" , "run"]
