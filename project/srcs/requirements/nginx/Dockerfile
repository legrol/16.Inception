# OS base image
# FROM debian:bookworm
FROM debian:bullseye

# Arguments needed by the image building process
ARG DEBIAN_FRONTEND

# Convert args to environment variables for runtime
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}

# Install nginx package, plus openssl and ca-certificates so we can read/use our .crt and .key
RUN apt-get update && apt-get install -y nginx openssl

# Set nginx configuration by copying our own .conf file in default configuration directory
# COPY requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default
# COPY requirements/nginx/conf/nginx.conf /etc/nginx/conf.d/default.conf

# Generate ssl certificate and key
# RUN openssl req -subj "/c=sp/st=malaga/l=malaga/o=42 malaga/ou=rdel-olm/cn=rdel-olm" \
# -new -newkey rsa:2048 -days 365 -nodes -x509 \
# -keyout /etc/nginx/ssl/rdel-olm.42.fr.key -out /etc/nginx/ssl/rdel-olm.42.fr.crt

# Copy our certificates into nginx ssl certificates directory
COPY requirements/tools/rdel-olm.42.fr.crt /etc/nginx/ssl/rdel-olm.42.fr.crt
COPY requirements/tools/rdel-olm.42.fr.key /etc/nginx/ssl/rdel-olm.42.fr.key
 
# Create a basic index.html in the index directory used by our config, so we can test if the server is working properly
# We will change this later, when wordpress is set and working
RUN touch /var/www/html/index.html && echo "<h1>Nginx is working!</h1>" > /var/www/html/index.html

EXPOSE 443

# CMD to be executed when docker-compose, to run nginx without daemon "mode"
CMD ["nginx", "-g", "daemon off;"]

