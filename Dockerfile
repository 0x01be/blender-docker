FROM 0x01be/xpra

USER root
RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    ca-certificates \
    unzip \
    blender \
    godot \
    mesa \
    libx11 \
    libxcursor \
    libxinerama \
    libxi \
    libxrandr \
    libexecinfo \
    yasm \
    eudev \
    alsa-lib \
    pulseaudio \
    pulseaudio-alsa \
    alsa-plugins-pulse \
    mesa-dri-swrast \
    py3-numpy

WORKDIR /home/xpra

ENV GODOT_VERSION 3.2.3
ADD https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_export_templates.tpz export_templates.tpz
ADD https://github.com/TobyLobster/ImportLDraw/releases/download/1.1.11/importldraw1.1.11_for_blender_281.zip importldraw.zip
ADD https://gitlab.com/Zamme/blender2godot/-/raw/master/Code/blender2godot.zip blender2godot.zip
ADD https://www.ldraw.org/library/updates/complete.zip parts.zip
ADD https://www.ldraw.org/library/unofficial/ldrawunf.zip unofficial.zip

RUN unzip parts.zip && rm parts.zip && chown -R xpra:xpra /home/xpra

USER xpra

ENV COMMAND "blender"

