FROM ubuntu:latest

# Actualizar e instalar herramientas básicas
RUN apt-get update && apt-get install -y \
    curl \
    git \
    openjdk-17-jdk

# Instalar Maven
RUN apt-get install -y maven

# Establecer variables de entorno de Maven
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG /root/.m2

# Directorio de trabajo
WORKDIR /app
COPY . /app
RUN mvn clean package

# Ejecutar una shell interactiva (bash) al iniciar el contenedor
CMD ["java", "-jar", "target/tbfit-0.0.1-SNAPSHOT.jar"]