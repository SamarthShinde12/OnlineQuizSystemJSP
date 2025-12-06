FROM tomcat:9.0

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file
COPY ./OnlineQuizSystem.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
