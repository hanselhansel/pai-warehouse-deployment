#!/bin/bash
set -e

# Build the image if it doesn't exist
docker build -t physical-ai/ros2-humble ./docker/ros2-humble

# Run an interactive container with the workspace mounted
# This container is stateless by default; use a named volume for persistence.
docker run -it --rm \
  --name physical-ai-ros2 \
  -v "$(pwd):/workspace" \
  -v physical-ai-ros2-home:/root \
  physical-ai/ros2-humble \
  bash
