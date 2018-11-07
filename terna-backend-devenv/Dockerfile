FROM ubuntu
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y libsvn-java curl xvfb libgtk-3-0 vim && apt-get clean
RUN useradd -p weblogic -m -U weblogic

WORKDIR /home/weblogic

COPY ./bundle.tar.gz /home/weblogic
RUN tar -xzvf bundle.tar.gz && rm -rf bundle.tar.gz && tar -xzvf jdk-8u181-linux-x64.tar.gz -C / && rm -rf jdk-8u181-linux-x64.tar.gz && chown -R weblogic:weblogic eclipse README.txt fmw_12.2.1.0.0_wls_quick.jar /jdk1.8.0_181

USER weblogic

ENV JAVA_HOME /jdk1.8.0_181
ENV PATH $PATH:/home/weblogic/eclipse:$JAVA_HOME/bin

RUN /jdk1.8.0_181/bin/java -jar fmw_12.2.1.0.0_wls_quick.jar -ignoreSysPrereqs && rm fmw_12.2.1.0.0_wls_quick.jar

# I volumi ora non sono anonimi ma vengono creati in fase di build e poi collegati in fase di run

ENTRYPOINT ["bash"]
