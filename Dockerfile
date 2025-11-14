# Usar JDK 21 Alpine
FROM eclipse-temurin:21-jdk-alpine

# Directorio de trabajo
WORKDIR /app

# Copiar todos los archivos del proyecto al contenedor
COPY . .

# Dar permisos de ejecución a gradlew
RUN chmod +x gradlew

# Construir la app usando Gradle
RUN ./gradlew build -x test

# Copiar el JAR generado a un nombre fijo
COPY build/libs/*-boot.jar app.jar


# Exponer el puerto de la app
EXPOSE 8080

# Comando para iniciar la app
ENTRYPOINT ["java", "-jar", "app.jar"]
