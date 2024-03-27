#!/bin/bash

if command -v nginx &> /dev/null; then
  echo "NGINX is already installed."
else
  echo "NGINX is not installed. Installing..."
  if sudo apt update && sudo apt install -y nginx; then
    echo "NGINX installation successful."
  else
    echo "NGINX installation failed."
  fi
fi