# Usa una imagen de OpenJDK para construir la aplicación
FROM openjdk:17-jdk-alpine AS build
WORKDIR /app

# Copia el archivo Gradle Wrapper
COPY gradlew ./
COPY gradle gradle

# Copia el archivo de construcción y el código fuente
COPY build.gradle settings.gradle ./
COPY src src

# Ejecuta el comando de compilación para crear el archivo .jar
RUN ./gradlew build --no-daemon

# Segunda fase: crear la imagen que se ejecutará
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copia el archivo .jar desde la fase de construcción
COPY --from=build /app/build/libs/*.jar app.jar

# Expone el puerto en el que tu aplicación se ejecuta (modifica si usas otro)
EXPOSE 8080

# Ejecuta la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
