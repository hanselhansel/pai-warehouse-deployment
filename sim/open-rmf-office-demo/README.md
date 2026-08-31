# Open-RMF Office Demo

Run the official Open-RMF office demo inside Docker and document it as a warehouse deployment scenario. This is the first hands-on simulation in the sprint.

## What Open-RMF is

Open-RMF (Robotics Middleware Framework) is an open-source fleet orchestration framework from Open Robotics. It coordinates multiple robots in a shared facility, handling:

- Task planning and assignment
- Traffic scheduling and conflict resolution
- Shared resource management (doors, lifts, chargers, lanes)
- Integration with building maps and robot fleet adapters

In a warehouse context, Open-RMF plays the role of the fleet manager or orchestration layer that sits between the WMS and the robots.

## How to run the demo

### 1. Start the container

From the warehouse-deployment repo root:

```bash
./docker/open-rmf/run.sh
```

This opens an interactive shell and maps port `7878` for the RMF panel.

### 2. Launch the office demo

Inside the container:

```bash
source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash  # skip if this file does not exist
ros2 launch rmf_demos_gz office.launch.xml server_uri:="ws://localhost:7878"
```

The first launch downloads Gazebo models. Wait for it to finish.

### 3. Open the RMF panel

On your Mac browser, go to:

https://open-rmf.github.io/rmf-panel-js/

The panel should show robot states and let you submit tasks. If it does not connect, verify the launch included `server_uri:="ws://localhost:7878"` and port `7878` is mapped.

### 4. Submit a task from the CLI

Open a second terminal and exec into the running container:

```bash
./docker/open-rmf/exec.sh
```

Inside the second container shell:

```bash
source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash  # skip if this file does not exist
ros2 run rmf_demos_tasks dispatch_patrol -p coe lounge -n 3 --use_sim_time
```

This sends a patrol/loop task between the `coe` and `lounge` waypoints.

## Key components to observe

When the demo is running, watch these concepts in the RMF panel and terminal:

| Component | What it does | Warehouse analogy |
|---|---|---|
| Building map | Defines lanes, waypoints, doors, rooms, and stations | Warehouse floor layout, pick zones, aisles, charging stations |
| Robot fleet adapter | Connects a simulated robot fleet to RMF | Fleet manager API that connects vendor robots to the WMS orchestration layer |
| Task dispatcher | Accepts task requests and assigns them to robots | WMS wave release → task queue → robot assignment |
| Traffic planner | Schedules robot paths and resolves conflicts | Aisle traffic management, deadlock prevention, zone reservations |
| RMF panel | Web dashboard for tasks and robot state | Supervisor dashboard in a warehouse |
| Door / lift controllers | Manage shared infrastructure | Automated doors, conveyors, elevators, sortation gates |

## What to document while running

1. **Task assignment.** Submit a patrol task. Which robot was assigned? How did RMF decide?
2. **Traffic conflict.** Submit multiple patrol tasks that cross the same lane. How does RMF prevent collisions? Are robots queued or rerouted?
3. **Charging / idle.** Do robots go to a charging station when idle? What triggers that behavior?
4. **Door interaction.** Submit a task that passes through a door. Does the door open automatically, and does RMF reserve the door as a resource?
5. **Failure behavior.** Stop a robot topic or kill a simulated robot process. How does RMF detect the failure and reassign the task?
6. **Waypoints and lanes.** Look at the building map. How are lanes, one-way restrictions, and speed limits encoded?

## Warehouse interpretation

Map the office demo concepts to a warehouse scenario:

| Office demo | Warehouse scenario |
|---|---|
| `coe` / `lounge` waypoints | Pick station A / pack-out station B |
| Patrol loop | Replenishment loop or milk run between storage and picking |
| Door resource | Aisle gate, conveyor crossing, or lift |
| Robot fleet | AMR fleet from one vendor |
| RMF panel | Warehouse supervisor dashboard |
| Task dispatcher | WMS-to-fleet integration layer |
| Traffic planner | Real-time aisle congestion and deadlock avoidance |
| Charging station | AMR charging bay |

## Common failure modes to observe

These are the same failure modes that matter in real warehouse deployments:

1. **Deadlock.** Two robots enter a narrow aisle from opposite ends and cannot pass.
2. **Task starvation.** A robot waits too long for a resource (door, charger) and misses its task window.
3. **Map mismatch.** The building map does not match the simulated floor, causing robots to stop or take wrong lanes.
4. **Fleet adapter lag.** The robot state updates slowly, so RMF assigns a task to a robot that is not actually ready.
5. **Resource contention.** Multiple robots request the same charger or door at the same time.

## Questions this demo should answer

1. How does RMF decide which robot gets a task?
2. How does it handle traffic conflicts in shared lanes?
3. What happens when a robot fails or is removed?
4. How does the map encode warehouse constraints (one-way aisles, no-go zones, charging)?
5. What does the WMS-to-fleet integration surface look like in practice?
6. What is missing from RMF that a real warehouse fleet manager would need (e.g., SKU-level picking, human-robot collaboration, WMS order waves)?

## Next steps

After running the demo, add notes to `office-demo-notes.md` in this directory. Capture:
- What worked and what did not.
- Screenshots or terminal logs.
- Observations on each component.
- How the office scenario maps to a warehouse scenario.
- Any custom tasks or experiments you ran.

Then move to the stretch milestone: add a custom task, annotate the office map as a warehouse layout, or sketch a WMS-to-RMF task bridge.
