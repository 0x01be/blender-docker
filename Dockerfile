FROM 0x01be/xpra

RUN apk add --no-cache --virtual blender-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    blender \
    mesa-dri-swrast

USER xpra
ENV COMMAND blender

