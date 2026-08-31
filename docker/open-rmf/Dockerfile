# Use the official Open-RMF demo image built on ROS 2 Humble and Gazebo Fortress.
# This image contains rmf_demos, Gazebo Ignition, and the RMF panel server.
FROM ghcr.io/open-rmf/rmf/rmf_demos:latest

# Source ROS 2 and Open-RMF workspaces automatically in new shells
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
    echo "source /opt/rmf/install/setup.bash" >> ~/.bashrc

WORKDIR /workspace
