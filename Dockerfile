FROM    maven:3-openjdk-8
RUN     mkdir -p /app/src
WORKDIR /app
copy    src pom.xml /src/
RUN     mvn package
CMD     ["java", "-jar","target/shipping-1-0.jar"]
