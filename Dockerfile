FROM      maven:3-openjdk-8
RUN       mkdir /app/src
WORKDIR   /app/src
COPY      src .
COPY      pom.xml  .
RUN       mvn package

FROM      openjdk:8-jre-slim
COPY      --from=build /app/target/shipping-1.0.jar shiiping.jar
CMD       ["java","-jar","shipping.jar"]