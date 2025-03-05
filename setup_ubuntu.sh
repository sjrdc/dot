#!/bin/bash

sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y \
     terminator \
     cmake \
     g++ \
     libboost-dev \
     python3-pdm-pep517 \
     python3-venv \
     node-http-server \
     emscripten \
     xstow \
     emacs

python3 -m venv ~/.local/env
