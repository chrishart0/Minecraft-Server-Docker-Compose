# Use an official OpenJDK runtime as the base image
FROM openjdk:16-jdk-slim


# Working directory inside the container
WORKDIR /app/minecraft

# Install wget and jq
RUN apt-get update && apt-get install -y wget jq && rm -rf /var/lib/apt/lists/*

# Expose the default Minecraft port
EXPOSE 25565

# Environment Variables
ENV EULA=false
ENV MIN_RAM=1G
ENV MAX_RAM=1G
ENV MINECRAFT_VERSION=1.17.1

# Command to run the Minecraft server
CMD ["/app/start-minecraft.sh"]
