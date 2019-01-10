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

# activate the ctsm environment
conda activate ctsm

# Setup notebook password
echo "Setting up you password for Jupyter Notebooks, enter something you will remember"
jupyter notebook password

# deactivate the ctsm environment
conda deactivate

echo "Done setting up your environment"
echo ""
echo "You can activate this environment using the following command:"
echo ""
echo "conda activate ctsm"
