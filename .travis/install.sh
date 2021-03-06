#!/bin/bash

set -e

# Download and install conda
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
else
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
fi

bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
rm ~/miniconda.sh

# Set up the right Python version
conda install -y -q python=$PYTHON_VERSION

# Install dependencies
conda install -y -q numpy scipy requests h5py scikit-learn pytest flake8
conda install -y -q -c pytorch pytorch-cpu=0.3.1

# Pushing docs
conda install -y -q sphinx sphinx_rtd_theme
