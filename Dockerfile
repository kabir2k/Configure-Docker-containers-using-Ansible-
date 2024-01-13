FROM ubuntu:20.04

# Install net-tools and openssh-server
RUN apt-get update && \
    apt-get install -y net-tools openssh-server passwd

# Generate host keys
RUN ssh-keygen -A

# Set root password
RUN echo 'root:ankush' | chpasswd

# Expose SSH port
EXPOSE 22

# Start SSH server and a shell
CMD ["/usr/sbin/sshd", "-D", "/bin/bash"]

