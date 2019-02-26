FROM debian:8-slim

# install latex
RUN apt-get update && apt-get --no-install-recommends install -y \
    texlive-full \
    chktex \
    latexmk && \
    rm -rf /var/lib/apt/lists && \
    apt-get --purge remove -y .\*-doc$ && \
    apt-get clean -y

# install node deps
RUN apt-get update && apt-get --no-install-recommends install -y \
    curl \
    build-essential && \
    rm -rf /var/lib/apt/lists && \
    apt-get --purge remove -y .\*-doc$ && \
    apt-get clean -y

SHELL ["/bin/bash", "-c"]

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

ENV NVM_DIR "/root/.nvm"
RUN source "$NVM_DIR/nvm.sh" && \
    nvm install 8