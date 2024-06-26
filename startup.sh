#!/bin/bash

# Define the repository URL
REPO_URL="https://github.com/gogasca/notebooks-mlops.git"
REPO_DIR="notebooks-mlops"
TARGET_USER="jupyter"


# Check if 'git' is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install Git and try again."
  exit 1
fi

# Check if 'pip' is installed
if ! command -v pip &> /dev/null; then
  echo "pip is not installed. Please install pip and try again."
  exit 1
fi

# Clone the repository
if [ -d "$REPO_DIR" ]; then
  echo "Repository directory already exists. Pulling the latest changes."
  cd "$REPO_DIR" && git pull
else
  echo "Cloning the repository from $REPO_URL"
  cd /home/jupyter
  git clone "$REPO_URL"
fi

conda activate base
sudo -u "$TARGET_USER" pip install openpyxl
sudo -u "$TARGET_USER" pip install pandas==1.3.5
echo "Script execution completed successfully."
