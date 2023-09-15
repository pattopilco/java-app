# DOCKERFILE

``` dockerfile
mvn clean test
mvn package -DskipTests
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

``` dockerfile
FROM openjdk:8-jdk-alpine
COPY target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]
```

``` dockerfile
docker build -t app-bootcamp:1.0.0 .
docker run --name app-bootcamp app-bootcamp:1.0.0 -p8080:8080 
```

``` 
curl localhost:8080/actuator/health
```

```dockerfile
docker container inspect app-bootcamp
docker container stop app-bootcamp
docker container rm app-bootcamp
```