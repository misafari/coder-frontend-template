FROM codercom/enterprise-base:ubuntu

# Install Node.js (Example for Node.js 18)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install VS Code Server manually (optional — Coder often handles this)
# RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install JetBrains support tools (for Gateway, etc.)
RUN apt-get update && apt-get install -y \
    unzip wget libfuse2

# Optional: Install JetBrains Toolbox CLI or Remote Development tools
RUN wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.28.1.15219.tar.gz && \
    tar -xzf jetbrains-toolbox-*.tar.gz && \
    mv jetbrains-toolbox-* /opt/jetbrains-toolbox

# Add coder user to use Fuse (needed for JetBrains Gateway sometimes)
RUN usermod -aG fuse coder