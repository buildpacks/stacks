FROM ubuntu:bionic
ARG jq_url=https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
ARG yj_url=https://github.com/sclevine/yj/releases/download/v2.0/yj-linux
ARG cnb_uid=1000
ARG cnb_gid=1000

RUN apt-get update && \
  apt-get install -y wget xz-utils ca-certificates && \
  rm -rf /var/lib/apt/lists/*

RUN \
  groupadd cnb --gid ${cnb_gid} && \
  useradd --uid ${cnb_uid} --gid ${cnb_gid} -m -s /bin/bash cnb

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

RUN wget -qO /usr/local/bin/jq "${jq_url}" && chmod +x /usr/local/bin/jq && \
  wget -qO /usr/local/bin/yj "${yj_url}" && chmod +x /usr/local/bin/yj
