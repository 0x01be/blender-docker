FROM 0x01be/xpra

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

WORKDIR /blender

RUN make deps
RUN make install

ENV COMMAND "blender"

