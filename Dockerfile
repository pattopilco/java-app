# =========== BUILD STAGE =====================
FROM maven AS build
WORKDIR /usr/app
# build maven .m2 cache as layer for reuse
COPY pom.xml /usr/app/
RUN mvn dependency:go-offline -B
# build application as fat executable JAR
COPY src /usr/app/src
RUN mvn package -DskipTests

# =========== RUN STAGE =====================

FROM openjdk:8-jdk-alpine
COPY --from=build /usr/app/target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]