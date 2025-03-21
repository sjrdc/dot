#!/bin/bash

# make sure we have the latest packages and index
sudo apt update && sudo apt dist-upgrade -y

# install terminal
sudo apt install -y \
     terminator

# install build tools
sudo apt install -y \
     cmake \
     g++ \
     gdb \
     build-essential \
     libboost-dev 

# install IDE(s)

sudo apt install -y \
     emacs 

# install web dev items
sudo apt install -y \
     emscripten 

# install python prerequisites
sudo apt install -y \
     python3-pdm-pep517 \
     python3-venv 

# configure python env 
python3 -m venv ~/.local/env
source ~/.local/env/activate
pip install pdm 
