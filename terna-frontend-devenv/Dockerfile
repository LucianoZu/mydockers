FROM node:8.15
LABEL maintainer="Luciano Zu"

# Install Visual Studio Code
ADD https://go.microsoft.com/fwlink/?LinkID=760868 vcode.deb

RUN apt-get update && apt-get install -q -y libx11-xcb1 sudo man meld && \
    dpkg --force-all -i vcode.deb && \
    apt-get install -q -y -f && \
    rm -f vcode.deb && apt-get clean && \
    useradd -p vscode -m -U vscode

RUN echo "fs.inotify.max_user_watches = 100000" > /etc/sysctl.d/local.conf

WORKDIR /home/vscode

USER vscode

# Install Visual Studio Code addon
RUN code --install-extension devboosts.angular-productivity-pack && \
    code --install-extension rbbit.typescript-hero

# Install Angular CLI
RUN mkdir /home/vscode/global && \
    mkdir /home/vscode/workspaces && \
    npm config set prefix '/home/vscode/global'

# Configure diff and merge tool
RUN git config --global diff.tool meld && \
    git config --global difftool.prompt false && \
    git config --global difftool.meld.cmd "meld "\$LOCAL" "\$REMOTE"" && \
    git config --global merge.tool meld && \
    git config --global mergetool.meld.cmd "meld "\$LOCAL" "\$MERGED" "\$REMOTE" --output "\$MERGED""

ENV PATH $PATH:/home/vscode/global/bin

ENTRYPOINT ["bash"]
