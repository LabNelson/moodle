ARG MOODLE_VERSION=5.2.3

FROM moodlehq/moodle-php-apache:8.3-bookworm

ARG MOODLE_VERSION

LABEL org.opencontainers.image.title="Moodle"
LABEL org.opencontainers.image.source="https://github.com/LabNelson/moodle"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        tar \
    && curl -fL \
        "https://download.moodle.org/download.php/stable502/moodle-${MOODLE_VERSION}.tgz" \
        -o /tmp/moodle.tgz \
    && mkdir -p /var/www/html \
    && tar -xzf /tmp/moodle.tgz \
        -C /var/www/html \
        --strip-components=1 \
    && rm -f /tmp/moodle.tgz \
    && chown -R www-data:www-data /var/www/html \
    && apt-get purge -y --auto-remove curl tar \
    && rm -rf /var/lib/apt/lists/*