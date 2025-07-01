#!/bin/sh
set -e

# =============================================
# Early Exit: if WordPress is already fully set up
# =============================================
if [ -f /var/www/html/wp-config.php ] && \
   wp core is-installed --allow-root --path="/var/www/html" && \
   wp user get "$WP_USER" --allow-root --path="/var/www/html" > /dev/null 2>&1; then
    echo "WordPress is already fully configured. Exiting setup."
    exit 0
fi

# =============================================
# 1) Check WP-CLI availability
# =============================================
if ! command -v wp > /dev/null 2>&1; then
    echo "Error: WP-CLI is not installed or not in PATH."
    exit 1
fi

# =============================================
# 2) Verify that WP core files are present
# =============================================
if [ ! -f /var/www/html/wp-load.php ]; then
    echo "Error: WordPress core files not found in /var/www/html"
    exit 1
fi

# =============================================
# 3) Generate wp-config.php using WP-CLI
# =============================================
echo "Generating wp-config.php with DB credentials…"
wp config create --allow-root \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASS" \
    --dbhost="mariadb" \
    --path="/var/www/html" \
    --force

# =============================================
# 4) Wait for MariaDB to be ready
# =============================================
MAX_RETRIES=5
RETRY_COUNT=0
until mysql -h mariadb -u"$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" > /dev/null 2>&1; do
    RETRY_COUNT=$((RETRY_COUNT+1))
    if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
        echo "Error: Could not connect to MariaDB after $MAX_RETRIES attempts"
        exit 1
    fi
    echo "Waiting for MariaDB… (attempt $RETRY_COUNT/$MAX_RETRIES)"
    sleep 5
done
echo "Database is ready."

# =============================================
# 5) Install WP core if not already installed
# =============================================
if ! wp core is-installed --allow-root --path="/var/www/html"; then
    echo "Running WordPress core install…"
    wp core install --allow-root \
        --url="https://$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_USER" \
        --admin_password="$WP_PASS" \
        --admin_email="$WP_EMAIL" \
        --path="/var/www/html"
elsecd s    
    echo "WordPress core already installed. Skipping."
fi

# =============================================
# 6) Create additional user if needed
# =============================================
if ! wp user list --allow-root --path="/var/www/html" | grep -q "^\s*[0-9]\+\s\+$GUEST_USER\s"; then
    echo "Creating additional WordPress user '$GUEST_USER'…"
    wp user create "$GUEST_USER" "$GUEST_EMAIL" \
        --role=author \
        --user_pass="$GUEST_PASS" \
        --allow-root \
        --path="/var/www/html"
else
    echo "User '$GUEST_USER' already exists. Skipping creation."
fi

echo "✅ WordPress setup completed successfully."
