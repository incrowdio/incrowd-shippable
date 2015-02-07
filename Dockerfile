FROM incrowd/incrowd-docker-base
MAINTAINER josh@servercobra.com

RUN useradd -d /home/shippable -m -s /bin/bash -p shippablepwd shippable
RUN echo 'shippable ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /home/shippable/.ssh /home/shippable/wrk
RUN chown -R shippable:shippable /home/shippable
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get update
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip git openssh-client
RUN sudo pip install virtualenv

ADD . /home/shippable/wrk

WORKDIR /home/shippable/wrk

USER shippable
CMD ["/bin/bash", "boot.sh"]
