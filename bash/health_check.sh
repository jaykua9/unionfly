#!/bin/bash

# Define the service name and health check URL
service_name="nginx"
health_check_url="http://localhost:8080"

# Restart the service using systemd
if systemctl restart "$service_name"; then
  echo "Service has been restarted."

  # Perform health check using curl
  for ((i = 1; i <= 60; i++)); do
    if curl -sSf --max-time 1 "$health_check_url" >/dev/null; then
      echo "Service has restarted."
      exit 0
    fi
    sleep 1
  done

  echo "Service restart failed. Health check did not pass."
else
  echo "Failed to restart the service."
fi