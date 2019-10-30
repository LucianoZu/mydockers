FROM ubuntu
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y curl vim && apt-get clean
RUN useradd -p luke -m -U luke

WORKDIR /home/luke

USER luke

ENTRYPOINT ["bash"]
