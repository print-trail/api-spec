#!/bin/bash

#
# This script provides you with a local redoc page to view the documentation
# for the OpenAPI description. Docker is a prerequesite.
#
# Run this sctipt from this directory to present redoc API documentation
# for the Print Trail channel API.
#
# From Windows Powershell, you can run:
#
#    wsl "./redoc.bash"
#
# Docs will be published to http://localhost:8089 by default
#
# If you want to publish to a different port, then set REDOC_PORT:
#
#    REDOC_PORT=9000 ./redoc.bash
#

REDOC_PORT=${REDOC_PORT:-8089}
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
API_VERSION=v1

echo Documentation is published to http://localhost:${REDOC_PORT}

docker run -it --rm -p ${REDOC_PORT}:80 \
  -v ${SCRIPT_DIR}/../openapi/${API_VERSION}/print-trail-channel-api.yaml:/usr/share/nginx/html/print-trail-channel-api.yaml \
  -e SPEC_URL=print-trail-channel-api.yaml \
  redocly/redoc

