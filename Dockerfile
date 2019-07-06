#имя базового образа
FROM tomcat:alpine

#скачивам пакеты
RUN apt-get update -qq && apt-get install default-jdk -y && apt-get install git -y && apt-get install maven -y

#создаем папку, где будет наша программа
RUN mkdir -p git

#создаем папку, клонируем исходники
RUN cd git && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

#идем в папку
WORKDIR /git/boxfuse/boxfuse-sample-java-war-hello

#копируем все файлы из текущего пути к файлу Docker на вашей системе в нашу новую папку образа
COPY . /git/boxfuse/boxfuse-sample-java-war-hello

CMD ["tomcat8", "run", "-web"]

#пробрасываем порт вашей программы наружу образа
EXPOSE 8000





FROM tomcat
RUN apt-get update -qq && apt-get install default-jdk -y && apt-get install git -y && apt-get install maven -y
RUN mkdir git && cd git && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd boxfuse-sample-java-war-hello && mvn package
COPY . /git/boxfuse/boxfuse-sample-java-war-hello
EXPOSE 80
CMD ["catalina.sh", "run"]