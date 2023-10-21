#!/bin/bash

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is not found! Installing..."
    sudo apt-get update && sudo apt-get install -y curl
else
    echo "curl is already installed."
fi

# Check if jq is installed (used for JSON parsing)
if ! command -v jq &> /dev/null; then
    echo "jq is not found! Installing..."
    sudo apt-get install -y jq
else
    echo "jq is already installed."
fi


# Create the minecraft directory if it doesn't exist
DIRECTORY="minecraft"
if [ ! -d "$DIRECTORY" ]; then
    mkdir -p $DIRECTORY
    echo "Directory $DIRECTORY created."
else
    echo "Directory $DIRECTORY already exists."
fi

cd $DIRECTORY

# Check permissions
if [ ! -w "." ]; then
    echo "You do not have write permissions for the $DIRECTORY directory."
    read -p "Do you want to try and set the necessary permissions? (y/n) " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sudo chown -R $(id -u):$(id -g) .
    else
        echo "Please ensure you have the correct permissions and run the script again."
        exit 1
    fi
fi

# Create eula.txt with agreement if it doesn't exist
if [ ! -f eula.txt ]; then
    echo "eula=true" > eula.txt
    echo "eula.txt created and agreement set to true."
else
    echo "eula.txt already exists."
fi

# Optionally, set up server.properties if it doesn't exist
# if [ ! -f server.properties ]; then
#     echo "Setting up server.properties..."
#     # Insert commands to set up server.properties
# fi

echo "Setup complete! You can now run your Minecraft server."
