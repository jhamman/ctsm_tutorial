#!/usr/bin/env bash

set -e

if [ -d "$HOME/miniconda" ]; then
  echo "Miniconda is already installed"; exit 1 
fi

echo 

# download Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;

# install Miniconda
bash miniconda.sh -b -p $HOME/miniconda

# put Conda in your path
export PATH="$HOME/miniconda/bin:$PATH"
hash -r

# configure Conda
conda config --set always_yes yes --set show_channel_urls true
conda info -a

# install the ctsm environment
conda env create --name ctsm --file environment.yml

# tell conda to ask for permission to install new packages
conda config --set always_yes no

echo "Done setting up your environment"
