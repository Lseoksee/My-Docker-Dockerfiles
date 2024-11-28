# ubuntu 베이스 이미지 사용
FROM da864268/my-ubuntu

LABEL maintainer="da864268@naver.com"
LABEL description="Conda"

# bash 로 변경
SHELL ["/bin/bash", "-c"]

# 패키지 설치
RUN apt update && apt upgrade -y && apt install \
libgl1 libglib2.0-0 -y


# Conda 설치를 위해 BuildKit 변수인 TARGETARCH 사용설정
ARG TARGETARCH

#Conda 설치
RUN mkdir -p ~/miniconda3 && \
# 빌드 환경에 따른 conda 버전 변수 설정
if [ "${TARGETARCH}" == "amd64" ]; then \
    export build_arch="x86_64"; \
elif [ "${TARGETARCH}" == "arm64" ]; then \
    export build_arch="aarch64"; \
else \
    export build_arch="s390x"; \
fi; \
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-"$build_arch".sh -O ~/miniconda3/miniconda.sh && \
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
rm -rf ~/miniconda3/miniconda.sh
ENV PATH="/root/miniconda3/bin:$PATH"
RUN conda init && source ~/.bashrc

# 프로젝트 폴더 구성
WORKDIR "/root"
