FROM 0x01be/xpra

USER root

RUN apk add --no-cache --virtual blender-build-dependencies \
    git \
    build-base \
    cmake \
    autoconf \
    automake \
    libtool \
    llvm-dev \
    glu-dev \
    sqlite-dev \
    openssl-dev \
    flac-dev \
    zlib-dev \
    libx11-dev \
    libxxf86vm-dev \
    libxcursor-dev \
    libxi-dev \
    libxrandr-dev \
    libxinerama-dev \
    jpeg-dev \
    libpng-dev \
    freetype-dev \
    python3-dev \
    nasm \
    yasm \
    tcl \
    bison \
    mesa-dev \
    boost-dev \
    ttf-freefont

RUN git clone --depth 1 https://git.blender.org/blender.git /blender
RUN git clone --depth 1 https://github.com/embree/embree /embree
RUN git clone --depth 1 https://github.com/ispc/ispc /ispc

WORKDIR /ispc/build
RUN cmake ..
RUN make install

WORKDIR /embree/build
RUN cmake ..
RUN make install

RUN mkdir -p /blender/build
WORKDIR /blender/build

RUN cmake \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
    -DPYTHON_LIBRARY=/usr/lib/python3.8/lib-dynload/ \
    ..
RUN make install

USER xpra

ENV COMMAND "blender"

