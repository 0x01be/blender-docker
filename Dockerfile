FROM 0x01be/xpra

USER root
RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    blender \
    mesa-dri-swrast

USER xpra

WORKDIR /workspace

ENV COMMAND "blender"

