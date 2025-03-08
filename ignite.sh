#!/bin/bash

CONTAINER_NAME=$1

if [ -z "$CONTAINER_NAME" ]; then
  # The -r flag prevents backslash escapes from being interpreted
  # The -p flag allows specifying the prompt text
  read -r -p "No container name provided. Are you recreating all? (y/n): " answer
  # =~ is the regex matching operator
  # ^[Yy]$ matches exactly one character that is either 'Y' or 'y'
  # The ! negates the condition, so it's true when the answer is NOT 'y' or 'Y'  
  if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
  fi
fi


docker compose up -d \
  --build \
  --force-recreate \
  --remove-orphans $CONTAINER_NAME