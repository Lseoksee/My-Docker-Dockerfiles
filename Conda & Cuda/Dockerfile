# ubuntu 베이스 이미지 사용
ARG BASE_VERSION=latest
FROM da864268/my-ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="Conda"

# bash 로 변경
SHELL ["/bin/bash", "-c"]

# 패키지 설치
RUN apt update && apt upgrade -y && apt install \
libgl1 libglib2.0-0 -y

# CUDA 버전 빌드 변수 추가
ARG CUDA_VERSION
ARG BASE_VERSION
# CUDA_VERSION이 명시되있는 경우 설치
RUN if ! [ -z "${CUDA_VERSION}" ]; then \
    # CUDA ToolKit 설치
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu$(echo "${BASE_VERSION}" | tr -d '.')/x86_64/cuda-keyring_1.0-1_all.deb && \
    dpkg -i cuda-keyring_1.0-1_all.deb && \
    apt-get update && \
    apt-get install cuda-toolkit-${CUDA_VERSION} -y && \
    rm -rf cuda-keyring_1.0-1_all.deb; \
fi

# CUDA Toolkit 환경변수 설정
ENV PATH="/usr/local/cuda/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# Conda 설치를 위해 BuildKit 변수인 TARGETARCH 사용설정
ARG TARGETARCH

#Conda 설치
RUN mkdir -p /miniconda3 && \
# 빌드 환경에 따른 conda 버전 변수 설정
if [ "${TARGETARCH}" == "amd64" ]; then \
    export build_arch="x86_64"; \
elif [ "${TARGETARCH}" == "arm64" ]; then \
    export build_arch="aarch64"; \
else \
    export build_arch="s390x"; \
fi; \
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-"$build_arch".sh -O /miniconda.sh && \
bash /miniconda.sh -b -u -p /miniconda3 && \
rm -rf /miniconda.sh

# Conda 환경변수 설정
ENV PATH="/miniconda3/bin:$PATH"
RUN conda init && source ~/.bashrc

# 프로젝트 폴더 구성
WORKDIR "/root"
