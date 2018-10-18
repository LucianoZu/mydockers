FROM ubuntu
LABEL maintainer="Luciano Zu"

WORKDIR /root

RUN apt-get update && apt-get install -q -y libsvn-java curl xvfb libgtk-3-0 vim
RUN useradd -p weblogic -m -U weblogic

COPY ./bundle.tar.gz /root
RUN tar -xzvf bundle.tar.gz && rm -rf bundle.tar.gz && tar -xzvf jdk-8u181-linux-x64.tar.gz -C / && rm -rf jdk-8u181-linux-x64.tar.gz && chown -R root:root eclipse README.txt && chown -R weblogic:weblogic /jdk1.8.0_181

ENV JAVA_HOME /jdk1.8.0_181
ENV PATH $PATH:/root/eclipse:$JAVA_HOME/bin

WORKDIR /home/weblogic
RUN mv /root/fmw_12.2.1.0.0_wls_quick.jar /home/weblogic && su -c "/jdk1.8.0_181/bin/java -jar fmw_12.2.1.0.0_wls_quick.jar -ignoreSysPrereqs" - weblogic && rm fmw_12.2.1.0.0_wls_quick.jar

WORKDIR /root

# I volumi ora non sono anonimi ma vengono creati in fase di build e poi collegati in fase di run

ENTRYPOINT ["bash"]
