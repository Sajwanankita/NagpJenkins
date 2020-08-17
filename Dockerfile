FROM tomcat:8
RUN wget --user=admin --password=admin123 -O /usr/local/tomcat/launchstation04 http://192.168.1.12:8081/artifactory/nagp_demo_snapshot/HelloWorld-0.0.1-SNAPSHOT.jar
EXPOSE 8080
