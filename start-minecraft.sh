#!/bin/bash

# Check for eula.txt
if [ ! -f eula.txt ]; then
    echo "*****************************************************************"
    echo "The setup.sh script hasn't been executed. Please run it first."
    echo "*****************************************************************"
    exit 1
fi

# Check if EULA is accepted
if [ "$EULA" != "true" ]; then
    echo "*****************************************************************"
    echo "You must accept the Minecraft EULA to run the server. Set EULA=true environment variable."
    echo "*****************************************************************"
    exit 1
fi

# Download server JAR if not present
if [ ! -f server.jar ]; then
    echo "server.jar file not found."
    pwd
    ls
    echo "Downloading server JAR..."
    SERVER_JAR_URL=$(wget -qO- https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r --arg VERSION "$MINECRAFT_VERSION" '.versions[] | select(.id == $VERSION) | .url')
    DOWNLOAD_URL=$(wget -qO- $SERVER_JAR_URL | jq -r '.downloads.server.url')
    wget -O server.jar $DOWNLOAD_URL
fi

# Start the Minecraft server
java -Xmx${MAX_RAM} -Xms${MIN_RAM} -jar server.jar nogui
