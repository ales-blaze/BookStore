FROM tomcat:8.0-alpine
ENV  CATALINA_HOME /usr/local/tomcat
ENV  PATH ${CATALINA_HOME}/bin:$PATH
RUN mkdir -p "${CATALINA_HOME}"
WORKDIR ${CATALINA_HOME}
ENV TOMCAT_MAJOR 8

#VOLUME /volume/webapp/
LABEL maintainer="alesblaze@gmail.com"
ADD ./target/bookstore-1.war  ${CATALINA_HOME}/webapps/
#RUN sh -c 'touch /usr/local/tomcat/webapps/bookstore-1.war'
EXPOSE 8080
# ENTRYPOINT ["sh", "-c" , "java -Djava.security.edg=file:/dev/./urandom -jar /usr/local/tomcat/webapps/app.war]
CMD ["catalina.sh" , "run"]
