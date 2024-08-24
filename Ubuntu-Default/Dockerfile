# ubuntu 베이스 이미지 사용
ARG BASE_VERSION=latest
FROM ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="my-ubuntu"

# 패키지 업데이트 먼저
RUN apt update
RUN apt upgrade -y

# 패키지 설치 
RUN apt install sudo -y
RUN apt install git -y
RUN apt install htop -y
RUN apt install vim -y
RUN apt install nano -y
RUN apt install wget -y
RUN apt install curl -y
RUN apt install tree -y
RUN apt install screen -y
RUN apt install zip -y
RUN apt install net-tools -y

#UTF-8 설정
ENV LC_ALL=C.utf8

# 프로젝트 폴더 구성
RUN mkdir "/workspace"
WORKDIR "/workspace"
