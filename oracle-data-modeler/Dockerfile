FROM ubuntu
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y libxrender1 libxext6 libxtst6 libxi6 && apt-get clean
RUN useradd -p developer -m -U developer

WORKDIR /home/developer

COPY ./bundle/datamodeler-19.1.0.081.0911-1.noarch.tar.gz /home/developer
COPY ./bundle/jdk-8u181-linux-x64.tar.gz /home/developer
RUN tar -xzvf datamodeler-19.1.0.081.0911-1.noarch.tar.gz -C / && rm -rf datamodeler-19.1.0.081.0911-1.noarch.tar.gz
RUN tar -xzvf jdk-8u181-linux-x64.tar.gz -C / && rm -rf jdk-8u181-linux-x64.tar.gz
RUN chown -R developer:developer /jdk1.8.0_181

USER developer

ENV JAVA_HOME /jdk1.8.0_181
ENV PATH $PATH:$JAVA_HOME/bin

RUN mkdir /home/developer/models

ENTRYPOINT ["bash"]
