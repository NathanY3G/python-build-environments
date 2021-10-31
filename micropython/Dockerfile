# SPDX-FileCopyrightText: Copyright 2021 Nathan Young
#
# SPDX-License-Identifier: Apache-2.0
FROM debian:bullseye-20211011-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apt-utils \
    build-essential autoconf libtool pkg-config cmake \
    git wget \
    python3 python3-pip \
    libffi-dev

ARG TOOLCHAIN_VERSION=10.3-2021.07

# Install the GNU Arm Embedded Toolchain
COPY gcc-arm-none-eabi-${TOOLCHAIN_VERSION}-x86_64-linux.tar.bz2 /opt/gcc-arm-none-eabi.tar.bz2

# TODO: Check MD5 is: b56ae639d9183c340f065ae114a30202 before extracting

RUN tar --directory=/opt -xjf /opt/gcc-arm-none-eabi.tar.bz2

ARG USER_ID=1234
ARG GROUP_ID=1234

RUN addgroup --quiet --gid ${GROUP_ID} bob && adduser --quiet --uid ${USER_ID} --gid ${GROUP_ID} --disabled-password --gecos GECOS bob
USER ${USER_ID}:${GROUP_ID}
ENV PATH="${PATH}:/opt/gcc-arm-none-eabi-${TOOLCHAIN_VERSION}/bin"

WORKDIR /usr/local/src

ENTRYPOINT ["/bin/bash"]
