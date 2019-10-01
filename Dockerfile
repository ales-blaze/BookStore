FROM tomcat:8.5.20-jre8-alpine
ENV  CATALINA_HOME /usr/local/tomcat
ENV  PATH ${CATALINA_HOME}/bin:$PATH
RUN mkdir -p "${CATALINA_HOME}"
WORKDIR ${CATALINA_HOME}
ENV TOMCAT_MAJOR 8
LABEL maintainer="alesblaze@gmail.com"
ADD ./target/bookstore-1.war  ${CATALINA_HOME}/webapps/
#COPY /usr/share/tomcat/conf/tomcat-users.xml usr/local/tomcat/conf/
#RUN sh -c 'touch /usr/local/tomcat/webapps/bookstore-1.war'
EXPOSE 8080
CMD ["catalina.sh" , "run"]
