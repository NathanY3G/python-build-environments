# SPDX-FileCopyrightText: Copyright 2021-2023 Nathan Young
#
# SPDX-License-Identifier: Apache-2.0
FROM debian:bookworm-20240311-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    bzip2 git git-lfs wget \
    build-essential cmake \
    python3 python3-venv \
    gettext uncrustify

ARG TOOLCHAIN_VERSION=10.3-2021.10

# Install the GNU Arm Embedded Toolchain
COPY gcc-arm-none-eabi-${TOOLCHAIN_VERSION}-x86_64-linux.tar.bz2 /opt/gcc-arm-none-eabi.tar.bz2

# TODO: Check MD5 is: b56ae639d9183c340f065ae114a30202 before extracting

RUN tar --directory=/opt -xjf /opt/gcc-arm-none-eabi.tar.bz2

# Switch to a lower privileged / non-root user account
ARG USER_ID=1234
ARG GROUP_ID=1234

RUN addgroup --quiet --gid ${GROUP_ID} blinka && adduser --quiet --uid ${USER_ID} --gid ${GROUP_ID} --disabled-password --gecos GECOS blinka
USER ${USER_ID}:${GROUP_ID}

# Use a virtual environment for the Python tools
ENV VIRTUAL_ENV=/home/blinka/.env
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}:/opt/gcc-arm-none-eabi-${TOOLCHAIN_VERSION}/bin"

# Install dependencies for the Python tools
RUN pip3 install huffman \
    cascadetoml jinja2 typer \
    requests requests-cache sh 'click<8' setuptools cpp-coveralls \
    'Sphinx<4' sphinx-rtd-theme myst-parser sphinx-autoapi sphinxcontrib-svg2pdfconverter readthedocs-sphinx-search \
    polib intelhex

WORKDIR /usr/local/src

ENTRYPOINT ["/bin/bash"]
