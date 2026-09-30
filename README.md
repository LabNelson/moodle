# moodle
Custom Moodle Docker image build with my favourite plugins based on the official Moodle HQ
`moodlehq/moodle-php-apache` image.

## Build

Images are built automatically using GitHub Actions.

Images are published to GitHub Container Registry:

- `ghcr.io/labnelson/moodle:<version>`
- `ghcr.io/labnelson/moodle:<version>-php8.3`

## Base image

The image is based on:

`moodlehq/moodle-php-apache:8.3-bookworm`

Moodle Core is downloaded from the official Moodle download server
during the Docker build.