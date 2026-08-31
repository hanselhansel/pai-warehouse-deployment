# Simulation Scenarios

Lightweight simulation scenarios for understanding warehouse and logistics robot orchestration. These are not training environments. They are learning environments for product, deployment, and solutions engineering.

## Open-RMF office demo

The first scenario is the Open-RMF office demo, scaffolded for Docker but not yet validated on this Mac. It is intended to demonstrate multi-robot fleet orchestration, task allocation, traffic management, and a simple WMS-like task dispatch interface.

See `open-rmf-office-demo/` for:
- How to run the demo.
- What components are involved.
- How the office scenario maps to a warehouse scenario.
- The observation template for a future validated run.

## Docker environments

- `docker/open-rmf/` — Docker setup and launch scripts for the Open-RMF office demo.
- `docker/ros2-humble/` — General ROS 2 Humble environment for learning middleware and running simple nodes.

## Constraints

- No physical robot hardware.
- No cloud GPU.
- Simulations run on CPU inside Docker on your Mac.
- Focus is on orchestration, integration, and deployment concepts, not robot learning or policy training.
