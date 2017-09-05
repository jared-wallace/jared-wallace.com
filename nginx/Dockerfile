# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER Andre Prado

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf
COPY fullchain.pem /etc/ssl-certs/fullchain.pem
COPY privkey.pem /etc/ssl-certs/privkey.pem
