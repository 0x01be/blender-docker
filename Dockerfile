FROM 0x01be/xpra

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

ENV COMMAND "blender"

