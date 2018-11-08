FROM node:8.12
LABEL maintainer="Luciano Zu"

# Install Visual Studio Code
ADD https://go.microsoft.com/fwlink/?LinkID=760868 vcode.deb

RUN apt-get update && apt-get install -q -y libx11-xcb1 sudo man && \
    dpkg --force-all -i vcode.deb && \
    apt-get install -q -y -f && \
    rm -f vcode.deb && apt-get clean && \
    useradd -p vscode -m -U vscode

WORKDIR /home/vscode

USER vscode

# Install Visual Studio Code addon
RUN code --install-extension devboosts.angular-productivity-pack && \
    code --install-extension rbbit.typescript-hero

# Install Angular CLI
RUN mkdir /home/vscode/global && \
    mkdir /home/vscode/workspaces && \
    npm config set prefix '/home/vscode/global'

ENV PATH $PATH:/home/vscode/global/bin

ENTRYPOINT ["bash"]
