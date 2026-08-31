#!/bin/bash
set -e

# Launch the Open-RMF office demo with the RMF panel websocket enabled.
# Run this inside the open-rmf container.

source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash
ros2 launch rmf_demos_gz office.launch.xml server_uri:="ws://localhost:7878"
