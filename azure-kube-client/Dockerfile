FROM ubuntu
LABEL maintainer="Luciano Zu"

RUN apt-get update && apt-get install -q -y curl vim && apt-get clean
RUN useradd -p luke -m -U luke

WORKDIR /home/luke

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN az aks install-cli

RUN curl -L https://git.io/get_helm.sh | bash

USER luke

ENTRYPOINT ["bash"]
