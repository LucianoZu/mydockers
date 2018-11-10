FROM ubuntu:16.04
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y libcrypto++9v5 libupnp6

RUN useradd -p adunanza -m -U adunanza

WORKDIR /home/adunanza

COPY ./amule-adunanza_2012.1+2.3.1~dfsg1-0ubuntu3_amd64.deb /home/adunanza
COPY ./libwxbase2.8-0_2.8.12.1+dfsg2-2ubuntu2_amd64.deb /home/adunanza
COPY ./libwxgtk2.8-0_2.8.12.1+dfsg2-2ubuntu2_amd64.deb /home/adunanza

RUN dpkg --force-all -i *deb
RUN apt-get install -f -q -y && \
    apt-get clean

RUN rm -f *.deb

USER adunanza

ENTRYPOINT ["bash"]
