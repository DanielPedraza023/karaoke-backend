# Usa una imagen base de Java
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo .jar dentro del contenedor
COPY build/libs/demo-0.0.1-SNAPSHOT.jar /app/demo.jar

# Comando para ejecutar el .jar
CMD ["java", "-jar", "demo.jar"]

# Exponer el puerto donde la aplicación se ejecutará
EXPOSE 8080