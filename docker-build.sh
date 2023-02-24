#!/usr/bin/env bash

set -euo pipefail
set -x

if [ -f release.properties ]; then
    VERSION=$(grep 'project.rel.dev.manujose0\\:trino-venice=' release.properties | cut -d'=' -f2)
else
    VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
fi
TRINO_VERSION=$(mvn help:evaluate -Dexpression=dep.trino.version -q -DforceStdout)
TAG=trino-venice:$VERSION

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    -t "$TAG" \
    --build-arg TRINO_VERSION="$TRINO_VERSION" \
    --build-arg VERSION="$VERSION" \
    --push \
    .
