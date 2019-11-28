FROM ubuntu
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y curl vim thunderbird && apt-get clean
RUN useradd -p thunderbird -m -U thunderbird

WORKDIR /home/thunderbird

USER thunderbird

ENTRYPOINT ["bash"]
