FROM tomcat:alpine
RUN wget -O /usr/local/tomcat/launchstation04 http://localhost:8081/artifactory/nagp_demo_snapshot/HelloWorld-0.0.1-SNAPSHOT.jar
EXPOSE 8080
