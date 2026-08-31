# End-to-End Runbook: Open-RMF Office Demo on Mac + Docker

A complete copy-paste guide for running the Open-RMF office demo inside Docker on your Mac. Paste these commands into your Codex terminal. Keep the paths and URLs as-is.

---

## 1. Verify your repo and Docker

Local repo path:
```bash
~/conductor/repos/physical-ai/warehouse-deployment
```

GitHub repo:
```
https://github.com/hanselhansel/pai-warehouse-deployment
```

Open a terminal and run:

```bash
cd ~/conductor/repos/physical-ai/warehouse-deployment
git status
```

You should see a clean `main` branch. If not, run:

```bash
git checkout main
git pull origin main
```

Check that Docker is running:

```bash
docker info
```

If Docker is not running, start Docker Desktop first.

---

## 2. Pull the official Open-RMF demo image

This image is large. Make sure you have at least 10-15 GB of free disk space and a stable connection.

```bash
docker pull ghcr.io/open-rmf/rmf/rmf_demos:latest
```

If `latest` fails, check the available tags at:
```
https://github.com/open-rmf/rmf/pkgs/container/rmf%2Frmf_demos
```

---

## 3. Start the Open-RMF container (interactive mode)

This gives you a shell inside the container and maps port `7878` to your Mac for the RMF panel.

```bash
docker run -it --name open-rmf -p 7878:7878 \
  -v "$(pwd):/workspace" \
  ghcr.io/open-rmf/rmf/rmf_demos:latest \
  bash
```

You will see a new shell prompt inside the container. Continue with Step 4.

---

## 4. Launch the Open-RMF office demo

Inside the container shell, run these commands one by one.

```bash
source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash 2>/dev/null || true
```

Then launch the demo with the RMF panel websocket enabled:

```bash
ros2 launch rmf_demos_gz office.launch.xml server_uri:="ws://localhost:7878"
```

The first launch downloads Gazebo simulation models. This can take 5-30 minutes. Wait for the terminal to show the demo is running. You will see lots of ROS and Gazebo messages.

If `rmf_demos_gz` does not exist, try the classic Gazebo version:

```bash
ros2 launch rmf_demos_gz_classic office.launch.xml server_uri:="ws://localhost:7878"
```

If `server_uri:="ws://localhost:7878"` does not work with your image version, try the rmf-web style endpoint:

```bash
ros2 launch rmf_demos_gz office.launch.xml server_uri:="ws://localhost:8000/_internal"
```

---

## 5. Open the RMF panel in your browser

Open this URL in a browser on your Mac:

```
https://open-rmf.github.io/rmf-panel-js/
```

The panel should connect to `ws://localhost:7878` and show:
- The building map.
- Robot icons moving.
- A task list panel.

If it does not connect:
1. Make sure the launch command included `server_uri:="ws://localhost:7878"`.
2. Make sure port `7878` is mapped (`docker run ... -p 7878:7878 ...`).
3. Check which websocket port the container is actually listening on by running the following inside the container:
   ```bash
   ss -tlnp
   ```
   If you see port `8000`, use `server_uri:="ws://localhost:8000/_internal"` and open the rmf-web dashboard at `http://localhost:3000` (you must run the dashboard container separately; see the official docs for that).

---

## 6. Submit a task from the CLI

Open a second terminal. You need a second terminal to send tasks while the demo keeps running.

In the second terminal, run:

```bash
docker exec -it open-rmf bash
```

Inside the second container shell, run:

```bash
source /opt/ros/humble/setup.bash
source /opt/rmf/install/setup.bash 2>/dev/null || true
ros2 run rmf_demos_tasks dispatch_patrol -p coe lounge -n 3 --use_sim_time
```

This sends a patrol/loop task between the `coe` and `lounge` waypoints. You should see a new task appear in the RMF panel, and a robot should start moving.

Other example tasks you can try:

```bash
# Patrol loop with more repeats
ros2 run rmf_demos_tasks dispatch_patrol -p coe lounge -n 5 --use_sim_time

# Delivery task (if the office map supports it)
ros2 run rmf_demos_tasks dispatch_delivery -p pantry -ph coke_dispenser -d hardware_2 -dh coke_ingestor --use_sim_time
```

---

## 7. Alternative: run the container in the background

If you prefer to run the launch in the background and not keep an interactive terminal open, use these commands instead of Step 3.

Start the container in detached mode:

```bash
docker run -d --name open-rmf -p 7878:7878 \
  -v "$(pwd):/workspace" \
  ghcr.io/open-rmf/rmf/rmf_demos:latest \
  tail -f /dev/null
```

Launch the demo inside the container:

```bash
docker exec -d open-rmf bash -c \
  'source /opt/ros/humble/setup.bash; source /opt/rmf/install/setup.bash 2>/dev/null || true; ros2 launch rmf_demos_gz office.launch.xml server_uri:="ws://localhost:7878"'
```

Watch the logs:

```bash
docker logs -f open-rmf
```

Then open the RMF panel and submit tasks as described in Steps 5 and 6.

---

## 8. Stop and clean up

When you are done, stop and remove the container:

```bash
docker stop open-rmf
docker rm open-rmf
```

To remove the image and free disk space:

```bash
docker rmi ghcr.io/open-rmf/rmf/rmf_demos:latest
```

---

## 9. What to observe and document

After the demo is running, watch these things and write your notes in:

```
~/conductor/repos/physical-ai/warehouse-deployment/sim/open-rmf-office-demo/office-demo-notes.md
```

Observation checklist:

- [ ] Which robot was assigned to the patrol task?
- [ ] How did RMF decide which robot to use?
- [ ] Did the robot avoid collisions with other robots?
- [ ] Did the robot open doors or wait for shared resources?
- [ ] What happens if you submit two overlapping patrol tasks that use the same lane?
- [ ] Did any robot go to a charging station while idle?
- [ ] Did the RMF panel show task status updates in real time?
- [ ] Did any task fail or get stuck?

Also read the full guide at:

```
~/conductor/repos/physical-ai/warehouse-deployment/sim/open-rmf-office-demo/README.md
```

---

## 10. Troubleshooting

### Container exits immediately

Check the logs:

```bash
docker logs open-rmf
```

Common causes:
- The image did not finish downloading.
- Docker does not have enough memory allocated. Increase Docker Desktop memory to at least 8 GB.

### RMF panel shows a blank map or no connection

1. Verify the launch command is still running.
2. Check that port `7878` is mapped.
3. Inside the container, check which ports are listening:
   ```bash
   ss -tlnp
   ```
4. Try the alternative `server_uri` values described in Step 4.

### Gazebo GUI does not appear on Mac

Gazebo GUI requires X11 forwarding. For this demo, you do not need the GUI. The simulation still runs and you can observe behavior through the RMF panel and ROS topics. If you want the GUI later, install XQuartz on your Mac and enable X11 forwarding.

### First launch is very slow

The first launch downloads Gazebo Fuel models. Subsequent launches are faster. Do not interrupt the process.

### Task command fails

Make sure the demo is fully launched and you are inside the same container (Step 6). Wait 30-60 seconds after the launch before sending tasks.

---

## 11. Related files

- Main simulation guide: `sim/open-rmf-office-demo/README.md`
- Running notes template: `sim/open-rmf-office-demo/office-demo-notes.md`
- Docker setup: `docker/open-rmf/`
- Deployment artifacts: `docs/`
- Sprint plan: `/Users/hansel/.devin/plans/plan-c988028e9e95c43f.md`
- Progress tracker: `foundation/docs/progress.md` (in the `physical-ai-foundation` repo)
