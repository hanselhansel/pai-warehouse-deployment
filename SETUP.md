# Cloud VM Setup for Physical AI Foundation

## Recommended provider and instance

As of 2026-08-31:

| Provider | Instance | GPU | Approximate price | Best for |
|---|---|---|---|---|
| Lambda Labs | 1x A100 40GB | A100 | ~$1.99/hr | Stable development + training |
| Lambda Labs | 1x A100 80GB | A100 | ~$2.79/hr | Larger Isaac Sim scenes |
| RunPod | 1x A100 40GB | A100 | ~$1.19/hr | Cheaper spot training |
| RunPod | 1x H100 | H100 | ~$1.99/hr | Faster training |

For a 3-month sprint, a persistent Lambda Labs A100 40GB is the simplest starting point. Expect ~$300–600/month if you keep it running and train a few hours per day. Shut it down when not in use.

## Base OS requirements

- Ubuntu 22.04 LTS
- NVIDIA GPU drivers pre-installed (or install via `ubuntu-drivers`)
- At least 200 GB NVMe storage
- SSH key access

## Initial software installation

After SSHing into the VM, run:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget tmux htop nvtop build-essential cmake python3-pip python3-venv

# Install Miniforge (recommended for Isaac Sim / Isaac Lab)
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh -b -p $HOME/miniforge3
source $HOME/miniforge3/bin/activate

# Create environment
conda create -n pai python=3.10 -y
conda activate pai

# Install PyTorch with CUDA
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# Install Isaac Sim and Isaac Lab (follow official docs for exact version)
# https://isaac-sim.github.io/
# https://isaaclab.github.io/

# Install ROS 2 Humble
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-humble-desktop
source /opt/ros/humble/setup.bash
```

## Clone the Physical AI repos

```bash
mkdir -p ~/repos && cd ~/repos
git clone https://github.com/hanselhansel/physical-ai-foundation.git
git clone https://github.com/hanselhansel/pai-warehouse-sim.git
git clone https://github.com/hanselhansel/pai-lerobot-contrib.git
git clone https://github.com/hanselhansel/pai-community.git
```

## Verify

```bash
nvidia-smi
python -c "import torch; print(torch.cuda.is_available())"
```

## Next steps

1. Complete Isaac Sim essentials tutorial.
2. Run a cartpole RL example in Isaac Lab.
3. Commit the working example to `pai-warehouse-sim/`.
