# Open-RMF Docker Environment

This directory contains a Docker setup for running Open-RMF demos on your Mac. It uses the official Open-RMF demo image, which includes ROS 2 Humble, Gazebo Fortress, and the `rmf_demos` packages.

> **Status:** This environment is scaffolded but has not been validated on this Mac. Verify the current image and commands before execution.

## Why this image

Building `rmf_demos` from source on Humble is complicated because of a `fastapi` packaging conflict. The official image is prebuilt and avoids that problem. It is large but saves hours of setup.

## Requirements

- Docker Desktop installed and running on your Mac.
- At least 10 GB of disk space for the image and Gazebo models.
- A stable internet connection. The first run downloads Gazebo fuel models.

## Run the container

```bash
cd /Users/hansel/conductor/repos/physical-ai/projects/warehouse-deployment
./docker/open-rmf/run.sh
```

This opens an interactive shell inside the container. The RMF panel websocket port `7878` is mapped to your Mac.

## Launch the office demo

Inside the container:

```bash
source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash
ros2 launch rmf_demos_gz office.launch.xml server_uri:="ws://localhost:7878"
```

The first launch downloads simulation models. This can take 5-30 minutes depending on your connection.

## View the RMF panel

Open this link in your Mac browser while the demo is running:

https://open-rmf.github.io/rmf-panel-js/

The panel should connect to `ws://localhost:7878` and show robot states and task queues. If it does not connect, check that port `7878` is mapped and the launch command included the `server_uri` parameter.

## Submit a task from the CLI

In a second terminal:

```bash
cd /Users/hansel/conductor/repos/physical-ai/projects/warehouse-deployment
./docker/open-rmf/exec.sh
```

Inside the second container shell:

```bash
source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash
ros2 run rmf_demos_tasks dispatch_patrol -p coe lounge -n 3 --use_sim_time
```

This sends a patrol/loop task between the `coe` and `lounge` waypoints.

## Headless mode (no GUI)

The simulation can run without a visible Gazebo window. The physics and traffic orchestration still execute. You can observe behavior through the RMF panel, ROS topics, and terminal logs.

## Troubleshooting

### RMF panel does not connect

- Verify the launch command included `server_uri:="ws://localhost:7878"`.
- Verify port `7878` is exposed in the `run.sh` command.
- Check the container logs for websocket server errors.

### Gazebo does not open on Mac

Gazebo GUI requires X11 forwarding. For this sprint, run headless and observe via the RMF panel and ROS topics. The simulation still runs.

### First launch is very slow

The first launch downloads Gazebo models from Ignition Fuel. Subsequent launches are faster.

## Next steps

After the demo runs, read the simulation notes in `sim/open-rmf-office-demo/README.md` to understand the components and map the office scenario to a warehouse deployment.
