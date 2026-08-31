# Local development environment

This directory contains Docker-based environments for the Warehouse Physical AI deployment project.

## ROS 2 Humble

A container with ROS 2 Humble desktop and basic robotics tools. This is for learning the middleware and integration stack, not for GPU training.

### Run

```bash
cd /Users/hansel/conductor/repos/physical-ai/projects/warehouse-deployment
./docker/ros2-humble/run.sh
```

Inside the container, ROS 2 is already sourced.

### Test

```bash
ros2 run turtlesim turtlesim_node
# In another terminal (attach a second shell to the same container):
# docker exec -it physical-ai-ros2 bash
ros2 run turtlesim turtle_teleop_key
```

## Isaac Sim

Isaac Sim is not included in this Docker image because it requires NVIDIA GPU support and is primarily supported on Linux. For this deployment-focused sprint, we will use ROS 2 for middleware/integration learning and lightweight diagrams for scenario building. Isaac Sim can be added later if a GPU environment becomes available.
