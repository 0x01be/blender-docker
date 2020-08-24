FROM 0x01be/xpra

USER root

RUN apk add --no-cache --virtual blender-build-dependencies \
    git \
    build-base \
    cmake \
    autoconf \
    automake \
    libtool \
    mesa-dev \
    ttf-freefont

RUN git clone --depth 1 https://git.blender.org/blender.git /blender

WORKDIR /blender

RUN make deps
RUN make install

USER xpra

WORKDIR /workspace

ENV COMMAND "blender"

