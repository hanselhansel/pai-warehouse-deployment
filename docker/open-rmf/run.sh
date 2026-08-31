#!/bin/bash
set -e

# Pull the latest official image if not already present
docker pull ghcr.io/open-rmf/rmf/rmf_demos:latest

# Run an interactive container with the RMF panel websocket port exposed
# Port 7878 is used by the hosted RMF panel (https://open-rmf.github.io/rmf-panel-js/)
# to monitor task and robot states.
docker run -it --rm \
  --name open-rmf-office \
  -p 7878:7878 \
  -v "$(pwd):/workspace" \
  ghcr.io/open-rmf/rmf/rmf_demos:latest \
  bash
