#!/bin/bash

server_name="$1"

nginx_config="/etc/nginx/conf.d/default.conf"

# Generate the NGINX site configuration
cat > "$nginx_config" <<EOF
server {
    listen 80;
    server_name $server_name;

    location / {
        # Configuration for handling requests
    }
}
EOF

# Restart NGINX to apply the changes
service nginx restart