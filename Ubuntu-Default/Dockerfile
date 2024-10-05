# ubuntu 베이스 이미지 사용
ARG BASE_VERSION=latest
FROM ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="my-ubuntu"

# 패키지 관리자 업데이트 & 패키지 설치 
RUN apt update && apt upgrade -y && apt install -y \
git \
htop \
vim \
nano \
wget \
curl \
tree \
screen \
zip \
net-tools \
mc && \
apt clean

#TimeZone 설정
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

#UTF-8 설정
ENV LC_ALL=C.utf8

# 프로젝트 폴더 구성
WORKDIR "/root"
