# build war
FROM maven:3.6.3-jdk-8-slim as build
WORKDIR /home/app
COPY . /home/app
RUN mvn -f /home/app/pom.xml clean package

# copy in war into webapps folder
FROM tomcat:8-alpine
COPY --from=build /home/app/target/*.war /usr/local/tomcat/webapps/ROOT.war

