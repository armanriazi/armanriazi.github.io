#!/bin/bash

# Prompt for message
echo "Enter your commit message:"
read -r message

# Check if there are uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    echo "There are uncommitted changes."
    echo "Adding changes to staging area..."
    
    # Add all changes
    git add .

    echo "Committing changes..."
    git commit -m "${message}"

    echo "Pushing data to remote server..."
    
    # Wait for a short time before pushing
    sleep 2
    
    git push -u origin master

    echo "Pushed data successfully!"
else
    echo "Working directory is clean. No changes to commit."
fi

# Display the current status
git status