# SPDX-FileCopyrightText: Copyright 2021 Nathan Young
#
# SPDX-License-Identifier: Apache-2.0
FROM debian:bullseye-20211220-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y gettext git make python3 python3-pip uncrustify wget

ARG TOOLCHAIN_VERSION=10.3-2021.07

# Install the GNU Arm Embedded Toolchain
COPY gcc-arm-none-eabi-${TOOLCHAIN_VERSION}-x86_64-linux.tar.bz2 /opt/gcc-arm-none-eabi.tar.bz2

# TODO: Check MD5 is: b56ae639d9183c340f065ae114a30202 before extracting

RUN tar --directory=/opt -xjf /opt/gcc-arm-none-eabi.tar.bz2

# Install Python dependencies
RUN pip3 install huffman \
    cascadetoml jinja2 typer \
    requests requests-cache sh 'click<8' setuptools cpp-coveralls \
    'Sphinx<4' sphinx-rtd-theme myst-parser sphinx-autoapi sphinxcontrib-svg2pdfconverter readthedocs-sphinx-search \
    polib intelhex

ARG USER_ID=1234
ARG GROUP_ID=1234

RUN addgroup --quiet --gid ${GROUP_ID} blinka && adduser --quiet --uid ${USER_ID} --gid ${GROUP_ID} --disabled-password --gecos GECOS blinka
USER ${USER_ID}:${GROUP_ID}
ENV PATH="${PATH}:/opt/gcc-arm-none-eabi-${TOOLCHAIN_VERSION}/bin"

WORKDIR /usr/local/src

ENTRYPOINT ["/bin/bash"]
