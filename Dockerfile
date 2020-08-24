FROM 0x01be/xpra

USER root

RUN apk add --no-cache --virtual blender-build-dependencies \
    git \
    build-base \
    cmake \
    autoconf \
    automake \
    libtool \
    nasm \
    yasm \
    tcl \
    bison \
    mesa-dev \
    python3-dev \
    ffmpeg-dev \
    jack-dev \
    libsndfile-dev \
    openal-soft-dev \
    sdl2-dev \
    fftw-dev \
    py3-numpy-dev \
    doxygen \
    graphviz \
    sphinx

ENV CFLAGGS "$CFLAGS -U_FORTIFY_SOURCE"
ENV CXXFLAGS "$CXXFLAGS -U_FORTIFY_SOURCE"

RUN git clone  https://github.com/audaspace/audaspace /audaspace

WORKDIR /audaspace/build

RUN cmake ..
RUN make install

RUN git clone --depth 1 https://git.blender.org/blender.git /blender

WORKDIR /blender

RUN make PYTHON=/usr/bin/python3 deps
RUN make PYTHON=/usr/bin/python3 install

USER xpra

WORKDIR /workspace

ENV COMMAND "blender"

