#!/bin/bash
set -e

# Submit a simple patrol/loop task in the office demo.
# Run this inside the open-rmf container after the demo is running.

source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash
ros2 run rmf_demos_tasks dispatch_patrol -p coe lounge -n 3 --use_sim_time
