FROM debian:stable-slim

# Install dependencies
RUN apt-get update \
    && apt-get install -y subversion rsync git zip curl php-cli php-zip unzip \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
