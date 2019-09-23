FROM tomcat:8.5-alpine
EXPOSE 8080
VOLUME /volume/webapp/
COPY /target/BookStore-1.war /usr/local/tomcat/webapps/app.war
RUN sh -c 'touch /usr/local/tomcat/webapps/app.war'
ENTRYPOINT ["sh", "-c" , "java -Djava.security.edg=file:/dev/./urandom -jar /usr/local/tomcat/webapps/app.war]
