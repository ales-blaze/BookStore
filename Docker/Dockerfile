FROM tomcat:8.5-alpine
EXPOSE 8080
VOLUME /volume/webapp/
COPY target/bookstore-1.war $CATALINA_HOME/webapps/
RUN sh -c 'touch /usr/local/tomcat/webapps/bookstore-1.war'
 ENTRYPOINT ["sh", "-c" , "java -Djava.security.edg=file:/dev/./urandom -jar /usr/local/tomcat/webapps/app.war]
#CMD ["catalina.sh" , "run"]
