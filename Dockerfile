FROM rundeck/rundeck:SNAPSHOT

ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV RDECK_BASE=/home/rundeck
ENV MANPATH=${MANPATH}:${RDECK_BASE}/docs/man
ENV PATH=${PATH}:${RDECK_BASE}/tools/bin

RUN sudo apt-get -y update \
  && sudo apt-get -y --no-install-recommends install ca-certificates python3-pip sshpass vim \
  && sudo -H pip3 --no-cache-dir install --upgrade pip setuptools \
  && sudo -H pip3 --no-cache-dir install ansible==2.9.2 \
  && sudo rm -rf /var/lib/apt/lists/* \
  && mkdir -p ${PROJECT_BASE}/etc/ \
  && sudo mkdir /etc/ansible