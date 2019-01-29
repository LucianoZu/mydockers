FROM google/dart
LABEL maintainer="Luciano Zu"

# Install Visual Studio Code
ADD https://go.microsoft.com/fwlink/?LinkID=760868 vcode.deb

RUN apt-get update && apt-get install -q -y libx11-xcb1 vim zip && \
    dpkg --force-all -i vcode.deb && \
    apt-get install -q -y -f && \
    rm -f vcode.deb && apt-get clean && \
    useradd -p developer -m -U developer

WORKDIR /home/developer

USER developer

# Install Visual Studio Code addon
RUN code --install-extension dart-code.dart-code

RUN mkdir workspaces

ENV PATH $PATH:/home/developer/.pub-cache/bin
RUN pub global activate stagehand 
RUN pub global activate webdev

VOLUME [ "/home/developer/.pub-cache" ]

ENTRYPOINT ["bash"]

