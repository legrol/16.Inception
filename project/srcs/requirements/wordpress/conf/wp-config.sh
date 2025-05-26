#!/bin/sh
set -e

# Generate only wp-config.php with WP-CLI
wp config create --allow-root \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASS" \
    --dbhost="mariadb" \
    --path="/var/www/html" \
    --force
