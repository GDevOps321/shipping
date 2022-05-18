FROM      maven:3-openjdk-8
RUN       mkdir /app/src
WORKDIR   /app/src
COPY      src .
COPY      pom.xml
RUN       mvn package
CMD       ["java","-jar","target/shipping-1.0.jar"]