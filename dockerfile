FROM moodlehq/moodle-php-apache:8.3-bookworm

ARG MOODLE_VERSION=5.2.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && git clone --depth 1 --branch v${MOODLE_VERSION} \
        https://github.com/moodle/moodle.git \
        /var/www/html \
    && apt-get purge -y --auto-remove git \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html
