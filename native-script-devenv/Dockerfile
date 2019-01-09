FROM node:11-stretch
LABEL maintainer="Luciano Zu"

# Download Visual Studio Code
ADD https://go.microsoft.com/fwlink/?LinkID=760868 vcode.deb

# Install some packages and Visual Studio Code
#libbz2-1.0:i386 libstdc++6:i386 (maybe usefull but not found!)
RUN apt-get update && apt-get install -q -y libx11-xcb1 sudo zip man \
    lib32z1 lib32ncurses5 libgl1-mesa-glx libpulse0 libasound2 \
    software-properties-common g++ && \
    dpkg --force-all -i vcode.deb && \
    apt-get install -q -y -f && \
    rm -f vcode.deb && apt-get clean && \
    useradd -p vscode -m -U vscode

WORKDIR /home/vscode

# Install JDK
COPY ./jdk-8u181-linux-x64.tar.gz /home/vscode
RUN tar -xzvf jdk-8u181-linux-x64.tar.gz -C / && rm -f jdk-8u181-linux-x64.tar.gz && chown -R vscode:vscode /jdk1.8.0_181
ENV JAVA_HOME /jdk1.8.0_181
ENV PATH $PATH:$JAVA_HOME/bin

# Install Android SDK
RUN mkdir /home/vscode/android
COPY ./sdk-tools-linux-4333796.zip /home/vscode/android
RUN cd android && unzip sdk-tools-linux-4333796.zip && rm -f sdk-tools-linux-4333796.zip && chown -R vscode:vscode /home/vscode/android
ENV ANDROID_HOME=/home/vscode/android
ENV PATH $PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator
ENV HOME=/home/vscode

USER vscode

# Install Visual Studio Code addon
RUN code --install-extension devboosts.angular-productivity-pack && \
    code --install-extension rbbit.typescript-hero

# Install Angular CLI
RUN mkdir /home/vscode/global && \
    mkdir /home/vscode/workspaces && \
    npm config set prefix '/home/vscode/global'

ENV PATH $PATH:/home/vscode/global/bin

VOLUME [ "/home/vscode/android" ]

ENTRYPOINT ["bash"]
