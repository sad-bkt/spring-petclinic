FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]

#FROM scratch
#COPY --from=build /app/target/spring-petclinic-*.jar /petclinic.jar
#
#ENV SPRING_DATASOURCE_URL=jdbc:h2:file:/data/petclinic
#ENV SPRING_DATASOURCE_USERNAME=sa
#ENV SPRING_DATASOURCE_PASSWORD=''
#ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update
#ENV SPRING_PROFILES_ACTIVE=default
#ENV JAVA_OPTS="-Xms128m -Xmx256m"
#
#EXPOSE 8080
#
#CMD ["java", "-jar", "/petclinic.jar"]



#FROM openjdk:17 as jdk
#
#WORKDIR /app
#
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
#RUN ./mvnw dependency:resolve
#
#COPY src ./src
#
#EXPOSE 8080
#
#CMD ["./mvnw", "spring-boot:run"]
