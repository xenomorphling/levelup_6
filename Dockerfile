FROM tomcat
# update system and install packages
RUN apt-get update -qq && apt-get install -yqq default-jdk git maven
# clone from git and deploy war-file
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package && cp target/hello-*.war /usr/local/tomcat/webapps
# announcement working port
EXPOSE 8080
# run tomcat with war-file
CMD ["catalina.sh", "run"]