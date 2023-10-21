# Minecraft Docker Compose Server

This repository contains a Docker Compose setup for running a Minecraft server. It abstracts the complexities of the server setup and provides an environment that's both isolated and reproducible.

## Table of Contents

- [Setup](#setup)
- [Usage](#usage)
- [Backup](#backup)
- [Contributing](#contributing)
- [License](#license)

## Setup

1. **Clone the Repository**:

    ```bash
    git clone git@github.com:chrishart0/Minecraft-Server-Docker-Compose.git
    cd Minecraft-Server-Docker-Compose.git
    ```

2. **Setup Environment Variables**:
    
    Copy the `.env.example` to `.env` and update the values based on your requirements.

    ```bash
    cp .env.example .env
    nano .env
    ```

3. **Start the Server**:

    Use Docker Compose to start the server:

    ```bash
    docker-compose up -d
    ```

## Usage

To interact with your Minecraft server:

- **Start**: `docker-compose up -d`
- **Stop**: `docker-compose down`
- **Logs**: `docker-compose logs -f`
- **Restart**: `docker-compose restart`

## Backup

It's crucial to periodically back up your world and game data. A sample backup script is included, but ensure to modify and test it as per your needs.

```bash
./backup.sh
```

## Contributing
If you wish to contribute to this project, please follow the guidelines in the CONTRIBUTING.md file.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

Note: Ensure to regularly update your server and plugins to the latest versions for performance improvements and security patches.


## Repository Contents

### Essential Files & Directories

- **Dockerfile**
  - *Description*: This file is used to define and build a custom Docker image tailored for the Minecraft server. It can include instructions to download specific server versions, install necessary dependencies, and set optimal default configurations.

- **docker-compose.yml**
  - *Description*: This YAML file instructs Docker Compose on how to run the Minecraft server container. It defines service specifications, including which image to use, port mappings, volume bindings for persistent data, environment variables, and inter-container dependencies.

- **.env.example**
  - *Description*: This is a template environment file. Users should copy this file to `.env` and modify it with specific values like `MINECRAFT_VERSION`, memory allocations, and other essential settings.

- **server-data/**
  - *Description*: A dedicated directory housing Minecraft server files. This ensures configurations, world data, logs, and other essential files persist outside the container, making upgrades and backups more straightforward.

### Utility Scripts

- **scripts/**
  - **backup.sh**
    - *Description*: A shell script that compresses and saves crucial game data, ensuring you have periodic backups of the world, configurations, and other vital server files.
  - **start.sh**, **stop.sh**, **restart.sh**
    - *Description*: These are utility shell scripts to simplify Docker Compose commands, providing a straightforward method for starting, stopping, or restarting the Minecraft server container.

### Automated Testing

- **.github/workflows/test.yml**
  - *Description*: This YAML file is designed for GitHub Actions, an automation tool integrated with GitHub repositories. It can be set up to trigger automatically when changes are pushed to the repo. This specific workflow aims to ensure the Docker image builds successfully, the server starts correctly, and any other tests deemed necessary. For instance, it can check if the server starts without errors within a specified timeout, ensuring that configuration files and other critical components are functioning as expected.

### Documentation

- **README.md**
  - *Description*: A comprehensive document that guides users and collaborators on the purpose of the repository, how to set up the server, manage configurations, and troubleshoot common issues.

- **CONTRIBUTING.md** (optional)
  - *Description*: If you're open to contributions, this file provides guidelines, best practices, and steps for collaborators to contribute effectively to the repository.

- **LICENSE**
  - *Description*: This file clearly defines the licensing terms, ensuring users and contributors understand their rights and responsibilities when using or modifying the repository's content.

### Add-ons & Extensions

- **plugins/** (if applicable)
  - *Description*: If you're using a server type like Spigot or Paper, this directory will store the plugins you wish to add. It makes managing and updating plugins easier, with a clear separation from core server files.

- **mods/** (if applicable)
  - *Description*: For modded servers (like Forge or Fabric), this directory will contain all the server mods. It ensures an organized structure and simplifies mod management.

- **database/** (if required)
  - *Description*: If your server setup or any plugins/mods require a database, this section could include initialization scripts, database configurations, or even Docker Compose service definitions for database containers.

- **monitoring/** (optional)
  - *Description*: For advanced users who wish to monitor server performance, this directory can hold configurations and integrations for tools like Prometheus, Grafana, or others, providing insights into server health and performance.

- **proxy/** (optional)
  - *Description*: If you plan to run multiple Minecraft servers or need a proxy for other reasons, this directory will contain configurations and necessary files for proxy setups, such as BungeeCord or Waterfall.

### Git Related

- **.gitignore**
  - *Description*: This file lists all files and directories that should be ignored by Git, ensuring sensitive information, large data files, or unnecessary files don't get pushed to the repository.

---

**Note**: For a seamless experience, consistently test every component. Regular updates to the Docker image, plugins, and mods are vital for maintaining server security and optimal performance. Ensure clear documentation to guide both users and potential contributors.