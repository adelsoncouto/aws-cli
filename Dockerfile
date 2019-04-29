FROM ubuntu:18.04

LABEL maintainer="Adelson Silva Couto <adscouto@gmail.com"

# instala dependencias
RUN DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python3 \
    python-dev \
    python3-distutils \
    jq \
    groff

# instala o pip
RUN mkdir -p /tmp/pip \
  && mkdir -p /root/.local/bin \
  && cd /tmp/pip \
  && curl -O https://bootstrap.pypa.io/get-pip.py \
  && python3 /tmp/pip/get-pip.py --user --no-warn-script-location \
  && ln -s /root/.local/bin/* /usr/local/sbin/

# instala aws cli
RUN pip3 install awscli --upgrade --user --no-warn-script-location \
  && ln -s /root/.local/bin/* /usr/sbin/

CMD ["/bin/bash"]
