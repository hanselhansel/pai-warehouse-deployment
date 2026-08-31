FROM ros:humble-ros-base-jammy

# Install basic tools and ROS 2 Humble desktop (includes demos, turtlesim, etc.)
RUN apt-get update && apt-get install -y \
    ros-humble-desktop \
    ros-humble-turtlesim \
    ros-humble-nav2-bringup \
    ros-humble-slam-toolbox \
    python3-pip \
    python3-colcon-common-extensions \
    git \
    tmux \
    vim \
    nano \
    wget \
    curl \
    net-tools \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Source ROS 2 automatically in new shells
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

WORKDIR /workspace
