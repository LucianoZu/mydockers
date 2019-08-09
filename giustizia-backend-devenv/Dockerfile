FROM ubuntu
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y libsvn-java curl xvfb libgtk-3-0 libwebkitgtk-3.0-0 vim unzip git && apt-get clean
RUN useradd -p developer -m -U developer

WORKDIR /home/developer

RUN mkdir /home/developer/.m2
COPY ./bundle/eclipse-jee-2019-06-R-linux-gtk-x86_64.tar.gz /home/developer
COPY ./bundle/jdk-8u181-linux-x64.tar.gz /home/developer
COPY ./bundle/.m2/settings.xml /home/developer/.m2
COPY ./bundle/README.txt /home/developer
COPY ./bundle/fmw_12.2.1.0.0_wls_quick.jar /home/developer
COPY ./bundle/jboss-4.2.3.GA.zip /home/developer
ADD https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.43/bin/apache-tomcat-8.5.43.tar.gz apache-tomcat-8.5.43.tar.gz
RUN tar -xzvf eclipse-jee-2019-06-R-linux-gtk-x86_64.tar.gz && rm -rf eclipse-jee-2019-06-R-linux-gtk-x86_64.tar.gz
RUN tar -xzvf jdk-8u181-linux-x64.tar.gz -C / && rm -rf jdk-8u181-linux-x64.tar.gz
RUN unzip jboss-4.2.3.GA.zip && rm -rf jboss-4.2.3.GA.zip
RUN tar -xzvf apache-tomcat-8.5.43.tar.gz && rm -rf apache-tomcat-8.5.43.tar.gz
RUN chown -R developer:developer .m2 eclipse README.txt fmw_12.2.1.0.0_wls_quick.jar jboss-4.2.3.GA apache-tomcat-8.5.43 /jdk1.8.0_181

COPY ./bundle/jdk-6u45-linux-x64.bin /
WORKDIR /
RUN /jdk-6u45-linux-x64.bin && rm -f /jdk-6u45-linux-x64.bin && chown -R developer:developer /jdk1.6.0_45
WORKDIR /home/developer

USER developer

ENV JAVA_HOME /jdk1.8.0_181
ENV PATH $PATH:/home/developer/eclipse:$JAVA_HOME/bin

RUN /jdk1.8.0_181/bin/java -jar fmw_12.2.1.0.0_wls_quick.jar -ignoreSysPrereqs && rm fmw_12.2.1.0.0_wls_quick.jar

RUN mkdir /home/developer/workspaces && \
    mkdir -p /home/developer/wls12210/user_projects

#Install JBoss Tools
RUN eclipse -nosplash -application org.eclipse.equinox.p2.director -repository https://download.jboss.org/jbosstools/photon/stable/composite/4.9.0 -installIU org.eclipse.recommenders.snipmatch.rcp.feature.feature.group,org.fusesource.ide.camel.editor.feature.feature.group,org.fusesource.ide.core.feature.feature.group,org.fusesource.ide.jmx.feature.feature.group,org.fusesource.ide.server.extensions.feature.feature.group,org.fusesource.ide.syndesis.extension.feature.feature.group,org.hibernate.eclipse.feature.feature.group,org.jboss.ide.eclipse.archives.feature.feature.group,org.jboss.ide.eclipse.as.feature.feature.group,org.jboss.tools.batch.feature.feature.group,org.jboss.tools.cdi.deltaspike.feature.feature.group,org.jboss.tools.cdi.feature.feature.group,org.jboss.tools.community.project.examples.feature.feature.group,org.jboss.tools.common.jdt.feature.feature.group,org.jboss.tools.community.central.feature.feature.group,org.jboss.tools.common.launcher.feature.feature.group,org.jboss.tools.forge.ext.feature.feature.group,org.jboss.tools.forge.feature.feature.group,org.jboss.tools.forge.m2e.feature.feature.group,org.jboss.tools.foundation.feature.feature.group,org.jboss.tools.foundation.security.linux.feature.feature.group,org.jboss.tools.fuse.transformation.feature.feature.group,org.jboss.tools.jmx.feature.feature.group,org.jboss.tools.jsf.feature.feature.group,org.jboss.tools.jst.angularjs.feature.feature.group,org.jboss.tools.jst.feature.feature.group,org.jboss.tools.jst.jsdt.feature.feature.group,org.jboss.tools.maven.apt.feature.feature.group,org.jboss.tools.maven.cdi.feature.feature.group,org.jboss.tools.maven.feature.feature.group,org.jboss.tools.maven.hibernate.feature.feature.group,org.jboss.tools.maven.jbosspackaging.feature.feature.group,org.jboss.tools.maven.jdt.feature.feature.group,org.jboss.tools.maven.project.examples.feature.feature.group,org.jboss.tools.maven.sourcelookup.feature.feature.group,org.jboss.tools.maven.springboot.feature.feature.group,org.jboss.tools.project.examples.feature.feature.group,org.jboss.tools.richfaces.feature.feature.group,org.jboss.tools.runtime.core.feature.feature.group,org.jboss.tools.stacks.core.feature.feature.group,org.jboss.tools.usage.feature.feature.group,org.jboss.tools.vpe.feature.feature.group,org.jboss.tools.websockets.feature.feature.group,org.jboss.tools.ws.jaxrs.feature.feature.group,org.jboss.tools.ws.jaxws.feature.feature.group,org.jboss.tools.wtp.runtimes.tomcat.feature.feature.group,org.jboss.tools.common.launcher.feature.feature.group

VOLUME [ "/home/developer/jboss-4.2.3.GA/server" ]
VOLUME [ "/home/developer/apache-tomcat-8.5.43" ]

ENTRYPOINT ["bash"]
