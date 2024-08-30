ARG BASE_VERSION=latest
FROM da864268/my-ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="no-root"

RUN apt update && apt upgrade -y

ARG USER_NAME=docker

# ubuntu 계정 지우고 다른 계정 추가
RUN userdel -rf ubuntu; \ 
adduser --disabled-password ${USER_NAME}

USER ${USER_NAME}
WORKDIR "/home/${USER_NAME}"