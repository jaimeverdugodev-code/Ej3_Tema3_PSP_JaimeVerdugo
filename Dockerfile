# Usar JDK 21 Alpine (ligero)
FROM eclipse-temurin:21-jdk-alpine

# Establecer directorio de trabajo en el contenedor
WORKDIR /app

# Copiar todos los archivos del proyecto al contenedor
COPY . .

# Construir la app usando Gradle (Kotlin)
# Si usas Maven, reemplaza esta línea por: RUN ./mvnw clean package
RUN ./gradlew build -x test

# Copiar el JAR generado a un nombre fijo
COPY build/libs/*.jar app.jar

# Exponer el puerto donde Spring Boot correrá
EXPOSE 8080

# Comando para iniciar la app
ENTRYPOINT ["java", "-jar", "app.jar"]
