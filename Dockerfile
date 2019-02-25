FROM node:8-slim

RUN apt-get update && apt-get --no-install-recommends install -y \
    texlive-full \
    chktex \
    latexmk \
    libpng-dev \ 
    libgif-dev \
    libjpeg-dev \
    pkg-config \
    python \
    libcairo2-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists

RUN npm i -G mdgen draw.io-export

ENTRYPOINT [ "/bin/bash", "-c" ]
